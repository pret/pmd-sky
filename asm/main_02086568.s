	.include "asm/macros.inc"
	.include "main_02086568.inc"

	.text

	arm_func_start sub_02086568
sub_02086568: ; 0x02086568
	bx lr
	arm_func_end sub_02086568

	arm_func_start sub_0208656C
sub_0208656C: ; 0x0208656C
	bx lr
	arm_func_end sub_0208656C

	arm_func_start sub_02086570
sub_02086570: ; 0x02086570
	ldr r1, [r0, #0x1c]
	str r1, [r0, #0x24]
	ldr r3, [r0, #0x20]
	str r3, [r0, #0x28]
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x2c]
	and r1, r2, r1
	sub r1, r3, r1
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x18]
	str r1, [r0, #0x34]
	bx lr
	arm_func_end sub_02086570

	arm_func_start sub_020865A0
sub_020865A0: ; 0x020865A0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r2
	mov r4, r0
	mov r6, r1
	bl sub_02086570
	cmp r5, #1
	ldreq r0, [r4, #0x20]
	add r2, r4, #0x28
	streq r0, [r4, #0x28]
	ldr r0, [r4]
	ldr r1, [r4, #0x1c]
	ldr r3, [r4, #0x48]
	ldr ip, [r4, #0x3c]
	blx ip
	cmp r0, #2
	moveq r1, #0
	streq r1, [r4, #0x28]
	cmp r6, #0
	ldrne r1, [r4, #0x28]
	strne r1, [r6]
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x28]
	add r0, r1, r0
	str r0, [r4, #0x18]
	ldr r0, [r4, #4]
	mov r0, r0, lsl #0x13
	movs r0, r0, lsr #0x1f
	bne _02086624
	ldr r0, [r4, #0x1c]
	add r1, r4, #0x28
	bl sub_0208656C
_02086624:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020865A0

	arm_func_start sub_0208662C
sub_0208662C: ; 0x0208662C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r2, [r5, #0x24]
	ldr r0, [r5, #0x1c]
	mov r4, r1
	subs r0, r2, r0
	beq _020866A4
	str r0, [r5, #0x28]
	ldr r0, [r5, #4]
	mov r0, r0, lsl #0x13
	movs r0, r0, lsr #0x1f
	bne _02086668
	ldr r0, [r5, #0x1c]
	add r1, r5, #0x28
	bl sub_02086568
_02086668:
	ldr r0, [r5]
	ldr r1, [r5, #0x1c]
	ldr r3, [r5, #0x48]
	ldr ip, [r5, #0x40]
	add r2, r5, #0x28
	blx ip
	cmp r4, #0
	ldrne r1, [r5, #0x28]
	strne r1, [r4]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #0x18]
	ldr r0, [r5, #0x28]
	add r0, r1, r0
	str r0, [r5, #0x18]
_020866A4:
	mov r0, r5
	bl sub_02086570
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0208662C

	arm_func_start sub_020866B4
sub_020866B4: ; 0x020866B4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r4, _020867AC ; =_020B2ED4
	mov r7, r3
	cmp r7, r4
	moveq r6, #2
	mov sl, r0
	movne r6, #5
	mov r0, #0x18
	mul r4, r6, r0
	ldr r5, _020867B0 ; =_022BC698
	mov sb, r1
	add r0, r5, r4
	mov r8, r2
	bl sub_0207A164
	cmp r0, #0
	bne _02086718
	ldr r0, _020867B4 ; =_022B966C
	ldr r2, _020867B8 ; =_022BC650
	ldr r1, [r0, #4]
	ldr r0, _020867BC ; =_022BC674
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
	b _02086770
_02086718:
	ldr r0, _020867B4 ; =_022B966C
	ldr r1, _020867B8 ; =_022BC650
	ldr r0, [r0, #4]
	ldr r1, [r1, r6, lsl #2]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _02086748
	ldr r1, _020867BC ; =_022BC674
	ldr r0, [r1, r6, lsl #2]
	add r0, r0, #1
	str r0, [r1, r6, lsl #2]
	b _02086770
_02086748:
	add r0, r5, r4
	bl sub_0207A048
	ldr r0, _020867B4 ; =_022B966C
	ldr r2, _020867B8 ; =_022BC650
	ldr r1, [r0, #4]
	ldr r0, _020867BC ; =_022BC674
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
_02086770:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	mov r3, r7
	bl sub_020867C0
	ldr r1, _020867BC ; =_022BC674
	mov r7, r0
	ldr r0, [r1, r6, lsl #2]
	subs r0, r0, #1
	str r0, [r1, r6, lsl #2]
	bne _020867A4
	add r0, r5, r4
	bl sub_0207A0CC
_020867A4:
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020867AC: .word _020B2ED4
_020867B0: .word _022BC698
_020867B4: .word _022B966C
_020867B8: .word _022BC650
_020867BC: .word _022BC674
	arm_func_end sub_020866B4

	arm_func_start sub_020867C0
sub_020867C0: ; 0x020867C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r7, r3
	mov sb, r0
	mov r8, r1
	mov r0, r7
	mov r1, #0
	mov r4, r2
	bl sub_0208B374
	cmp r0, #0
	bne _020867F8
	mov r0, r7
	mvn r1, #0
	bl sub_0208B374
_020867F8:
	muls r4, r8, r4
	beq _0208681C
	ldrb r0, [r7, #0xd]
	cmp r0, #0
	bne _0208681C
	ldr r1, [r7, #4]
	mov r0, r1, lsl #0x16
	movs r0, r0, lsr #0x1d
	bne _02086828
_0208681C:
	add sp, sp, #4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_02086828:
	mov r0, r1, lsl #0x13
	movs r0, r0, lsr #0x1f
	movne r0, r1, lsl #0x19
	movne r0, r0, lsr #0x1e
	ldr r1, [r7, #8]
	cmpne r0, #2
	mov r6, #1
	mov r0, r1, lsl #0x1d
	movne r6, #0
	movs r0, r0, lsr #0x1d
	bne _0208687C
	ldr r0, [r7, #4]
	mov r0, r0, lsl #0x1b
	mov r0, r0, lsr #0x1d
	tst r0, #1
	beq _0208687C
	bic r0, r1, #7
	orr r0, r0, #2
	str r0, [r7, #8]
	mov r0, #0
	str r0, [r7, #0x28]
_0208687C:
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #2
	bhs _020868A8
	mov r0, #1
	strb r0, [r7, #0xd]
	mov r0, #0
	add sp, sp, #4
	str r0, [r7, #0x28]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020868A8:
	ldr r0, [r7, #4]
	mov r0, r0, lsl #0x19
	mov r0, r0, lsr #0x1e
	tst r0, #1
	beq _020868E0
	bl sub_02086468
	cmp r0, #0
	beq _020868E0
	mov r0, #1
	strb r0, [r7, #0xd]
	mov r0, #0
	add sp, sp, #4
	str r0, [r7, #0x28]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020868E0:
	cmp r4, #0
	mov r5, #0
	beq _020869A4
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #3
	blo _020869A4
	mov sl, r5
_02086904:
	mov r0, r7
	mov r1, sl
	bl sub_0208B374
	cmp r0, #1
	ldr r0, [r7, #8]
	bne _02086938
	mov r0, r0, lsl #0x1d
	add r0, r7, r0, lsr #28
	ldrh r0, [r0, #0xe]
	add r5, r5, #2
	sub r4, r4, #2
	strh r0, [sb], #2
	b _02086950
_02086938:
	mov r0, r0, lsl #0x1d
	add r0, r7, r0, lsr #29
	ldrb r0, [r0, #0xf]
	add r5, r5, #1
	sub r4, r4, #1
	strb r0, [sb], #1
_02086950:
	ldr r1, [r7, #8]
	cmp r4, #0
	mov r0, r1, lsl #0x1d
	mov r0, r0, lsr #0x1d
	sub r0, r0, #1
	bic r1, r1, #7
	and r0, r0, #7
	orr r0, r1, r0
	str r0, [r7, #8]
	beq _0208698C
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #3
	bhs _02086904
_0208698C:
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #2
	ldreq r0, [r7, #0x30]
	streq r0, [r7, #0x28]
_020869A4:
	cmp r4, #0
	beq _02086A68
	ldr r0, [r7, #0x28]
	cmp r0, #0
	cmpeq r6, #0
	beq _02086A68
	mov sl, #0
_020869C0:
	ldr r0, [r7, #0x28]
	cmp r0, #0
	bne _02086A14
	mov r0, r7
	mov r1, sl
	mov r2, sl
	bl sub_020865A0
	cmp r0, #0
	beq _02086A14
	cmp r0, #1
	mov r0, #1
	streqb r0, [r7, #0xd]
	beq _02086A04
	ldr r1, [r7, #8]
	bic r1, r1, #7
	str r1, [r7, #8]
	strb r0, [r7, #0xc]
_02086A04:
	mov r0, #0
	str r0, [r7, #0x28]
	mov r4, #0
	b _02086A68
_02086A14:
	ldr r0, [r7, #0x28]
	str r0, [sp]
	cmp r0, r4
	strhi r4, [sp]
	ldr r1, [r7, #0x24]
	ldr r2, [sp]
	mov r0, sb
	bl memcpy
	ldr r2, [sp]
	ldr r0, [r7, #0x24]
	subs r4, r4, r2
	add r0, r0, r2
	str r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	ldr r0, [sp]
	add sb, sb, r2
	sub r0, r1, r0
	add r5, r5, r2
	str r0, [r7, #0x28]
	cmpne r6, #0
	bne _020869C0
_02086A68:
	cmp r4, #0
	beq _02086AF4
	cmp r6, #0
	bne _02086AF4
	ldr r6, [r7, #0x1c]
	ldr sl, [r7, #0x20]
	add r1, sp, #0
	str sb, [r7, #0x1c]
	mov r0, r7
	mov r2, #1
	str r4, [r7, #0x20]
	bl sub_020865A0
	cmp r0, #0
	beq _02086AD4
	cmp r0, #1
	mov r0, #1
	bne _02086ABC
	strb r0, [r7, #0xd]
	mov r0, #0
	str r0, [r7, #0x28]
	b _02086AD4
_02086ABC:
	ldr r1, [r7, #8]
	bic r1, r1, #7
	str r1, [r7, #8]
	strb r0, [r7, #0xc]
	mov r0, #0
	str r0, [r7, #0x28]
_02086AD4:
	ldr r1, [sp]
	mov r0, r7
	str r6, [r7, #0x1c]
	str sl, [r7, #0x20]
	add r5, r5, r1
	bl sub_02086570
	mov r0, #0
	str r0, [r7, #0x28]
_02086AF4:
	mov r0, r5
	mov r1, r8
	bl _u32_div_f
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end sub_020867C0

	arm_func_start sub_02086B08
sub_02086B08: ; 0x02086B08
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #4]
	mov r1, r1, lsl #0x16
	movs r1, r1, lsr #0x1d
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl sub_02086B7C
	mov r4, r0
	ldr r0, [r5]
	ldr r1, [r5, #0x44]
	blx r1
	ldr r1, [r5, #4]
	mov r2, #0
	bic r1, r1, #0x380
	str r1, [r5, #4]
	str r2, [r5]
	ldr r1, [r5, #8]
	mov r1, r1, lsl #0x1c
	movs r1, r1, lsr #0x1f
	subne r0, r2, #1
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	cmpeq r0, #0
	movne r2, #1
	rsb r0, r2, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_02086B08

	arm_func_start sub_02086B7C
sub_02086B7C: ; 0x02086B7C
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02086B90
	bl sub_020864F4
	ldmia sp!, {r4, pc}
_02086B90:
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	bne _02086BAC
	ldr r0, [r4, #4]
	mov r1, r0, lsl #0x16
	movs r1, r1, lsr #0x1d
	bne _02086BB4
_02086BAC:
	mvn r0, #0
	ldmia sp!, {r4, pc}
_02086BB4:
	mov r0, r0, lsl #0x1b
	mov r0, r0, lsr #0x1d
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #8]
	mov r1, r0, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #3
	bichs r0, r0, #7
	orrhs r0, r0, #2
	strhs r0, [r4, #8]
	ldr r0, [r4, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #2
	moveq r0, #0
	streq r0, [r4, #0x28]
	ldr r0, [r4, #8]
	mov r1, r0, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #1
	beq _02086C20
	bic r0, r0, #7
	str r0, [r4, #8]
	mov r0, #0
	ldmia sp!, {r4, pc}
_02086C20:
	mov r0, r4
	mov r1, #0
	bl sub_0208662C
	cmp r0, #0
	mov r0, #0
	beq _02086C4C
	mov r1, #1
	strb r1, [r4, #0xd]
	str r0, [r4, #0x28]
	sub r0, r0, #1
	ldmia sp!, {r4, pc}
_02086C4C:
	ldr r1, [r4, #8]
	bic r1, r1, #7
	str r1, [r4, #8]
	str r0, [r4, #0x18]
	str r0, [r4, #0x28]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02086B7C

	arm_func_start sub_02086C64
sub_02086C64: ; 0x02086C64
	stmdb sp!, {r3, r4, r5, lr}
	cmp r2, #0
	mov lr, #0
	ble _02086CE0
	ldr ip, _02086CE8 ; =_020AECB0
_02086C78:
	ldrsb r3, [r0], #1
	cmp r3, #0
	blt _02086C90
	cmp r3, #0x80
	bge _02086C90
	ldrb r3, [ip, r3]
_02086C90:
	ldrsb r5, [r1], #1
	mov r3, r3, lsl #0x18
	mov r4, r3, asr #0x18
	cmp r5, #0
	blt _02086CB0
	cmp r5, #0x80
	bge _02086CB0
	ldrb r5, [ip, r5]
_02086CB0:
	mov r3, r5, lsl #0x18
	cmp r4, r3, asr #24
	mvnlt r0, #0
	ldmltia sp!, {r3, r4, r5, pc}
	movgt r0, #1
	ldmgtia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add lr, lr, #1
	cmp lr, r2
	blt _02086C78
_02086CE0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02086CE8: .word _020AECB0
	arm_func_end sub_02086C64

	arm_func_start sub_02086CEC
sub_02086CEC: ; 0x02086CEC
	ldr r1, [r0, #4]
	mov r1, r1, lsl #0x16
	mov r1, r1, lsr #0x1d
	and r1, r1, #0xff
	add r1, r1, #0xff
	and r1, r1, #0xff
	cmp r1, #1
	bhi _02086D18
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	beq _02086D2C
_02086D18:
	ldr r0, _02086D64 ; =_022BCA70
	mov r1, #0x28
	str r1, [r0]
	sub r0, r1, #0x29
	bx lr
_02086D2C:
	ldr r1, [r0, #8]
	mov r1, r1, lsl #0x1d
	movs ip, r1, lsr #0x1d
	ldreq r0, [r0, #0x18]
	bxeq lr
	ldr r2, [r0, #0x24]
	ldr r1, [r0, #0x1c]
	ldr r3, [r0, #0x34]
	sub r0, r2, r1
	cmp ip, #3
	add r0, r3, r0
	subhs r1, ip, #2
	subhs r0, r0, r1
	bx lr
	.align 2, 0
_02086D64: .word _022BCA70
	arm_func_end sub_02086CEC

	arm_func_start sub_02086D68
sub_02086D68: ; 0x02086D68
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _02086E68 ; =_020B2ED4
	mov r7, r0
	cmp r7, r1
	moveq r6, #2
	beq _02086DA0
	ldr r0, _02086E6C ; =_020B2F20
	cmp r7, r0
	moveq r6, #3
	beq _02086DA0
	ldr r0, _02086E70 ; =_020B2F6C
	cmp r7, r0
	moveq r6, #4
	movne r6, #5
_02086DA0:
	mov r0, #0x18
	mul r4, r6, r0
	ldr r5, _02086E74 ; =_022BC698
	add r0, r5, r4
	bl sub_0207A164
	cmp r0, #0
	bne _02086DE0
	ldr r0, _02086E78 ; =_022B966C
	ldr r2, _02086E7C ; =_022BC650
	ldr r1, [r0, #4]
	ldr r0, _02086E80 ; =_022BC674
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
	b _02086E38
_02086DE0:
	ldr r0, _02086E78 ; =_022B966C
	ldr r1, _02086E7C ; =_022BC650
	ldr r0, [r0, #4]
	ldr r1, [r1, r6, lsl #2]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _02086E10
	ldr r1, _02086E80 ; =_022BC674
	ldr r0, [r1, r6, lsl #2]
	add r0, r0, #1
	str r0, [r1, r6, lsl #2]
	b _02086E38
_02086E10:
	add r0, r5, r4
	bl sub_0207A048
	ldr r0, _02086E78 ; =_022B966C
	ldr r2, _02086E7C ; =_022BC650
	ldr r1, [r0, #4]
	ldr r0, _02086E80 ; =_022BC674
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
_02086E38:
	mov r0, r7
	bl sub_02086CEC
	ldr r1, _02086E80 ; =_022BC674
	mov r7, r0
	ldr r0, [r1, r6, lsl #2]
	subs r0, r0, #1
	str r0, [r1, r6, lsl #2]
	bne _02086E60
	add r0, r5, r4
	bl sub_0207A0CC
_02086E60:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02086E68: .word _020B2ED4
_02086E6C: .word _020B2F20
_02086E70: .word _020B2F6C
_02086E74: .word _022BC698
_02086E78: .word _022B966C
_02086E7C: .word _022BC650
_02086E80: .word _022BC674
	arm_func_end sub_02086D68

	arm_func_start sub_02086E84
sub_02086E84: ; 0x02086E84
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r1, [r5, #4]
	mov r4, r2
	mov r1, r1, lsl #0x16
	mov r1, r1, lsr #0x1d
	and r1, r1, #0xff
	cmp r1, #1
	ldreqb r1, [r5, #0xd]
	cmpeq r1, #0
	beq _02086ED0
	ldr r0, _02087068 ; =_022BCA70
	mov r1, #0x28
	str r1, [r0]
	sub r0, r1, #0x29
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_02086ED0:
	ldr r1, [r5, #8]
	mov r1, r1, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #1
	bne _02086F20
	mov r1, #0
	bl sub_0208662C
	cmp r0, #0
	beq _02086F20
	mov r0, #1
	strb r0, [r5, #0xd]
	mov r2, #0
	ldr r0, _02087068 ; =_022BCA70
	mov r1, #0x28
	str r2, [r5, #0x28]
	str r1, [r0]
	sub r0, r1, #0x29
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_02086F20:
	cmp r4, #1
	bne _02086F40
	mov r0, r5
	mov r4, #0
	bl sub_02086CEC
	ldr r1, [sp, #0x14]
	add r0, r1, r0
	str r0, [sp, #0x14]
_02086F40:
	cmp r4, #2
	beq _02086FD4
	ldr r0, [r5, #4]
	mov r0, r0, lsl #0x1b
	mov r0, r0, lsr #0x1d
	cmp r0, #3
	beq _02086FD4
	ldr r0, [r5, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	sub r0, r0, #2
	cmp r0, #1
	bhi _02086FD4
	ldr r2, [sp, #0x14]
	ldr r0, [r5, #0x18]
	cmp r2, r0
	bhs _02086F90
	ldr r0, [r5, #0x34]
	cmp r2, r0
	bhs _02086FA0
_02086F90:
	ldr r0, [r5, #8]
	bic r0, r0, #7
	str r0, [r5, #8]
	b _02086FE0
_02086FA0:
	ldr r1, [r5, #0x1c]
	sub r0, r2, r0
	add r0, r1, r0
	str r0, [r5, #0x24]
	ldr r1, [r5, #0x18]
	ldr r0, [sp, #0x14]
	sub r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #8]
	bic r0, r0, #7
	orr r0, r0, #2
	str r0, [r5, #8]
	b _02086FE0
_02086FD4:
	ldr r0, [r5, #8]
	bic r0, r0, #7
	str r0, [r5, #8]
_02086FE0:
	ldr r0, [r5, #8]
	mov r0, r0, lsl #0x1d
	movs r0, r0, lsr #0x1d
	bne _02087058
	ldr ip, [r5, #0x38]
	cmp ip, #0
	beq _02087044
	ldr r0, [r5]
	ldr r3, [r5, #0x48]
	add r1, sp, #0x14
	mov r2, r4
	blx ip
	cmp r0, #0
	beq _02087044
	mov r0, #1
	strb r0, [r5, #0xd]
	mov r2, #0
	ldr r0, _02087068 ; =_022BCA70
	mov r1, #0x28
	str r2, [r5, #0x28]
	str r1, [r0]
	sub r0, r1, #0x29
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_02087044:
	mov r1, #0
	strb r1, [r5, #0xc]
	ldr r0, [sp, #0x14]
	str r0, [r5, #0x18]
	str r1, [r5, #0x28]
_02087058:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02087068: .word _022BCA70
	arm_func_end sub_02086E84

	arm_func_start sub_0208706C
sub_0208706C: ; 0x0208706C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r3, _0208717C ; =_020B2ED4
	mov sb, r0
	cmp sb, r3
	mov r8, r1
	mov r7, r2
	moveq r6, #2
	beq _020870AC
	ldr r0, _02087180 ; =_020B2F20
	cmp sb, r0
	moveq r6, #3
	beq _020870AC
	ldr r0, _02087184 ; =_020B2F6C
	cmp sb, r0
	moveq r6, #4
	movne r6, #5
_020870AC:
	mov r0, #0x18
	mul r4, r6, r0
	ldr r5, _02087188 ; =_022BC698
	add r0, r5, r4
	bl sub_0207A164
	cmp r0, #0
	bne _020870EC
	ldr r0, _0208718C ; =_022B966C
	ldr r2, _02087190 ; =_022BC650
	ldr r1, [r0, #4]
	ldr r0, _02087194 ; =_022BC674
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
	b _02087144
_020870EC:
	ldr r0, _0208718C ; =_022B966C
	ldr r1, _02087190 ; =_022BC650
	ldr r0, [r0, #4]
	ldr r1, [r1, r6, lsl #2]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _0208711C
	ldr r1, _02087194 ; =_022BC674
	ldr r0, [r1, r6, lsl #2]
	add r0, r0, #1
	str r0, [r1, r6, lsl #2]
	b _02087144
_0208711C:
	add r0, r5, r4
	bl sub_0207A048
	ldr r0, _0208718C ; =_022B966C
	ldr r2, _02087190 ; =_022BC650
	ldr r1, [r0, #4]
	ldr r0, _02087194 ; =_022BC674
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
_02087144:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	bl sub_02086E84
	ldr r1, _02087194 ; =_022BC674
	mov r7, r0
	ldr r0, [r1, r6, lsl #2]
	subs r0, r0, #1
	str r0, [r1, r6, lsl #2]
	bne _02087174
	add r0, r5, r4
	bl sub_0207A0CC
_02087174:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0208717C: .word _020B2ED4
_02087180: .word _020B2F20
_02087184: .word _020B2F6C
_02087188: .word _022BC698
_0208718C: .word _022B966C
_02087190: .word _022BC650
_02087194: .word _022BC674
	arm_func_end sub_0208706C

	arm_func_start sub_02087198
sub_02087198: ; 0x02087198
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r4, r0
	mov r2, r1
	strb r1, [r4, #0xd]
	bl sub_0208706C
	mov r0, #0
	strb r0, [r4, #0xd]
	ldmia sp!, {r4, pc}
	arm_func_end sub_02087198

	arm_func_start mbtowc
mbtowc: ; 0x020871BC
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	cmp r2, #0
	mvneq r0, #0
	bxeq lr
	cmp r0, #0
	ldrneb r2, [r1]
	strneh r2, [r0]
	ldrsb r0, [r1]
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end mbtowc

	arm_func_start TryAssignByte
TryAssignByte: ; 0x020871F4
	cmp r0, #0
	moveq r0, #0
	strneb r1, [r0]
	movne r0, #1
	bx lr
	arm_func_end TryAssignByte

	arm_func_start TryAssignByteWrapper
TryAssignByteWrapper: ; 0x02087208
	stmdb sp!, {r3, lr}
	ldr r2, _02087220 ; =_020B301C
	ldr r2, [r2, #8]
	ldr r2, [r2, #4]
	blx r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_02087220: .word _020B301C
	arm_func_end TryAssignByteWrapper

	arm_func_start wcstombs
wcstombs: ; 0x02087224
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r4, r0
	mov sb, r1
	cmpne sb, #0
	mov r8, r2
	mov r7, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r6, sp, #0
_02087248:
	ldrh r1, [sb]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r4, r7]
	beq _02087294
	mov r0, r6
	add sb, sb, #2
	bl TryAssignByteWrapper
	mov r5, r0
	add r0, r7, r5
	cmp r0, r8
	bhi _02087294
	mov r1, r6
	mov r2, r5
	add r0, r4, r7
	bl strncpy
	add r7, r7, r5
	cmp r7, r8
	bls _02087248
_02087294:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end wcstombs

	arm_func_start memcpy
memcpy: ; 0x0208729C
	mov ip, r0
	cmp r2, #0
	bxeq lr
_020872A8:
	ldrsb r3, [r1], #1
	subs r2, r2, #1
	strb r3, [ip], #1
	bne _020872A8
	bx lr
	arm_func_end memcpy

	arm_func_start memmove
memmove: ; 0x020872BC
	cmp r1, r0
	blo _020872E4
	mov ip, r0
	cmp r2, #0
	bxeq lr
_020872D0:
	ldrsb r3, [r1], #1
	subs r2, r2, #1
	strb r3, [ip], #1
	bne _020872D0
	bx lr
_020872E4:
	cmp r2, #0
	add r3, r1, r2
	add ip, r0, r2
	bxeq lr
_020872F4:
	ldrsb r1, [r3, #-1]!
	subs r2, r2, #1
	strb r1, [ip, #-1]!
	bne _020872F4
	bx lr
	arm_func_end memmove

	arm_func_start memset
memset: ; 0x02087308
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl memset_internal
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end memset

	arm_func_start memchr
memchr: ; 0x0208731C
	cmp r2, #0
	and r3, r1, #0xff
	beq _02087340
_02087328:
	ldrb r1, [r0], #1
	cmp r1, r3
	subeq r0, r0, #1
	bxeq lr
	subs r2, r2, #1
	bne _02087328
_02087340:
	mov r0, #0
	bx lr
	arm_func_end memchr

	arm_func_start memcmp
memcmp: ; 0x02087348
	cmp r2, #0
	beq _02087380
_02087350:
	ldrb ip, [r0], #1
	ldrb r3, [r1], #1
	cmp ip, r3
	beq _02087378
	ldrb r2, [r0, #-1]
	ldrb r0, [r1, #-1]
	cmp r2, r0
	mvnlo r0, #0
	movhs r0, #1
	bx lr
_02087378:
	subs r2, r2, #1
	bne _02087350
_02087380:
	mov r0, #0
	bx lr
	arm_func_end memcmp

	arm_func_start memset_internal
memset_internal: ; 0x02087388
	cmp r2, #0x20
	and r3, r1, #0xff
	blo _0208741C
	rsb r1, r0, #0
	ands ip, r1, #3
	beq _020873B4
	sub r2, r2, ip
	and r1, r3, #0xff
_020873A8:
	strb r1, [r0], #1
	subs ip, ip, #1
	bne _020873A8
_020873B4:
	cmp r3, #0
	beq _020873CC
	mov r1, r3, lsl #0x10
	orr r1, r1, r3, lsl #24
	orr r1, r1, r3, lsl #8
	orr r3, r3, r1
_020873CC:
	movs r1, r2, lsr #5
	beq _02087400
_020873D4:
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	str r3, [r0, #0x10]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	str r3, [r0, #0x1c]
	add r0, r0, #0x20
	subs r1, r1, #1
	bne _020873D4
_02087400:
	and r1, r2, #0x1f
	movs r1, r1, lsr #2
	beq _02087418
_0208740C:
	str r3, [r0], #4
	subs r1, r1, #1
	bne _0208740C
_02087418:
	and r2, r2, #3
_0208741C:
	cmp r2, #0
	bxeq lr
	and r1, r3, #0xff
_02087428:
	strb r1, [r0], #1
	subs r2, r2, #1
	bne _02087428
	bx lr
	arm_func_end memset_internal

	arm_func_start sub_02087438
sub_02087438: ; 0x02087438
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldrsb r3, [r0, #1]
	mov r4, #0
	mov r5, #1
	mov lr, r2
	strb r5, [sp]
	strb r4, [sp, #1]
	strb r4, [sp, #2]
	strb r4, [sp, #3]
	strb r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	cmp r3, #0x25
	add ip, r0, #1
	bne _02087494
	add r0, sp, #0
	strb r3, [sp, #5]
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add sp, sp, #0x10
	add r0, ip, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02087494:
	mov r2, #2
	mov r0, r4
	mov r5, r2
	mov r6, r4
	mov r7, #1
_020874A8:
	mov r8, r7
	cmp r3, #0x2b
	bgt _020874D8
	bge _02087500
	cmp r3, #0x23
	bgt _02087530
	cmp r3, #0x20
	blt _02087530
	beq _02087508
	cmp r3, #0x23
	beq _02087518
	b _02087530
_020874D8:
	cmp r3, #0x30
	bgt _02087530
	cmp r3, #0x2d
	blt _02087530
	beq _020874F8
	cmp r3, #0x30
	beq _02087520
	b _02087530
_020874F8:
	strb r6, [sp]
	b _02087534
_02087500:
	strb r7, [sp, #1]
	b _02087534
_02087508:
	ldrb r4, [sp, #1]
	cmp r4, #1
	strneb r5, [sp, #1]
	b _02087534
_02087518:
	strb r7, [sp, #3]
	b _02087534
_02087520:
	ldrb r4, [sp]
	cmp r4, #0
	strneb r2, [sp]
	b _02087534
_02087530:
	mov r8, r0
_02087534:
	cmp r8, #0
	ldrnesb r3, [ip, #1]!
	bne _020874A8
	cmp r3, #0x2a
	bne _0208757C
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	ldr r0, [r0, #-4]
	str r0, [sp, #8]
	cmp r0, #0
	bge _02087574
	rsb r0, r0, #0
	mov r2, #0
	strb r2, [sp]
	str r0, [sp, #8]
_02087574:
	ldrsb r3, [ip, #1]!
	b _020875CC
_0208757C:
	ldr r4, _020879C0 ; =_020AEDB0
	mov r5, #0
	mov r0, #0xa
	b _020875A0
_0208758C:
	ldr r2, [sp, #8]
	sub r3, r3, #0x30
	mla r6, r2, r0, r3
	ldrsb r3, [ip, #1]!
	str r6, [sp, #8]
_020875A0:
	cmp r3, #0
	blt _020875B0
	cmp r3, #0x80
	blt _020875B8
_020875B0:
	mov r2, r5
	b _020875C4
_020875B8:
	mov r2, r3, lsl #1
	ldrh r2, [r4, r2]
	and r2, r2, #8
_020875C4:
	cmp r2, #0
	bne _0208758C
_020875CC:
	ldr r2, [sp, #8]
	ldr r0, _020879C4 ; =0x000001FD
	cmp r2, r0
	ble _020875FC
	mov r1, #0xff
	add r0, sp, #0
	strb r1, [sp, #5]
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add sp, sp, #0x10
	add r0, ip, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020875FC:
	cmp r3, #0x2e
	bne _02087690
	ldrsb r3, [ip, #1]!
	mov r0, #1
	strb r0, [sp, #2]
	cmp r3, #0x2a
	bne _02087640
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	ldr r0, [r0, #-4]
	ldrsb r3, [ip, #1]!
	str r0, [sp, #0xc]
	cmp r0, #0
	movlt r0, #0
	strltb r0, [sp, #2]
	b _02087690
_02087640:
	ldr r2, _020879C0 ; =_020AEDB0
	mov r4, #0
	mov r0, #0xa
	b _02087664
_02087650:
	ldr r1, [sp, #0xc]
	sub r3, r3, #0x30
	mla r5, r1, r0, r3
	ldrsb r3, [ip, #1]!
	str r5, [sp, #0xc]
_02087664:
	cmp r3, #0
	blt _02087674
	cmp r3, #0x80
	blt _0208767C
_02087674:
	mov r1, r4
	b _02087688
_0208767C:
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	and r1, r1, #8
_02087688:
	cmp r1, #0
	bne _02087650
_02087690:
	cmp r3, #0x6c
	mov r0, #1
	bgt _020876C8
	cmp r3, #0x68
	blt _020876BC
	beq _020876E4
	cmp r3, #0x6a
	beq _02087730
	cmp r3, #0x6c
	beq _02087700
	b _02087754
_020876BC:
	cmp r3, #0x4c
	beq _02087724
	b _02087754
_020876C8:
	cmp r3, #0x74
	bgt _020876D8
	beq _0208773C
	b _02087754
_020876D8:
	cmp r3, #0x7a
	beq _02087748
	b _02087754
_020876E4:
	ldrsb r1, [ip, #1]
	mov r2, #2
	strb r2, [sp, #4]
	cmp r1, #0x68
	streqb r0, [sp, #4]
	ldreqsb r3, [ip, #1]!
	b _02087758
_02087700:
	ldrsb r1, [ip, #1]
	mov r2, #3
	strb r2, [sp, #4]
	cmp r1, #0x6c
	bne _02087758
	mov r1, #4
	strb r1, [sp, #4]
	ldrsb r3, [ip, #1]!
	b _02087758
_02087724:
	mov r1, #9
	strb r1, [sp, #4]
	b _02087758
_02087730:
	mov r1, #6
	strb r1, [sp, #4]
	b _02087758
_0208773C:
	mov r1, #8
	strb r1, [sp, #4]
	b _02087758
_02087748:
	mov r1, #7
	strb r1, [sp, #4]
	b _02087758
_02087754:
	mov r0, #0
_02087758:
	cmp r0, #0
	ldrnesb r3, [ip, #1]!
	strb r3, [sp, #5]
	cmp r3, #0x61
	bgt _020877AC
	bge _02087894
	cmp r3, #0x47
	bgt _020877A0
	subs r0, r3, #0x41
	addpl pc, pc, r0, lsl #2
	b _020879A0
_02087784: ; jump table
	b _02087894 ; case 0
	b _020879A0 ; case 1
	b _020879A0 ; case 2
	b _020879A0 ; case 3
	b _020878DC ; case 4
	b _0208785C ; case 5
	b _020878CC ; case 6
_020877A0:
	cmp r3, #0x58
	beq _02087820
	b _020879A0
_020877AC:
	cmp r3, #0x63
	bgt _020877BC
	beq _0208793C
	b _020879A0
_020877BC:
	sub r0, r3, #0x64
	cmp r0, #0x14
	addls pc, pc, r0, lsl #2
	b _020879A0
_020877CC: ; jump table
	b _02087820 ; case 0
	b _020878DC ; case 1
	b _0208785C ; case 2
	b _020878CC ; case 3
	b _020879A0 ; case 4
	b _02087820 ; case 5
	b _020879A0 ; case 6
	b _020879A0 ; case 7
	b _020879A0 ; case 8
	b _020879A0 ; case 9
	b _0208798C ; case 10
	b _02087820 ; case 11
	b _02087918 ; case 12
	b _020879A0 ; case 13
	b _020879A0 ; case 14
	b _02087968 ; case 15
	b _020879A0 ; case 16
	b _02087820 ; case 17
	b _020879A0 ; case 18
	b _020879A0 ; case 19
	b _02087820 ; case 20
_02087820:
	ldrb r0, [sp, #4]
	cmp r0, #9
	moveq r0, #0xff
	streqb r0, [sp, #5]
	beq _020879A8
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
	beq _020879A8
	ldrb r0, [sp]
	cmp r0, #2
	moveq r0, #1
	streqb r0, [sp]
	b _020879A8
_0208785C:
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	moveq r0, #0xff
	streqb r0, [sp, #5]
	beq _020879A8
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp, #0xc]
	b _020879A8
_02087894:
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #0xd
	streq r0, [sp, #0xc]
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	cmpne r0, #1
	moveq r0, #0xff
	streqb r0, [sp, #5]
	b _020879A8
_020878CC:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
_020878DC:
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	cmpne r0, #1
	moveq r0, #0xff
	streqb r0, [sp, #5]
	beq _020879A8
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp, #0xc]
	b _020879A8
_02087918:
	mov r3, #0x78
	mov r2, #1
	mov r1, #3
	mov r0, #8
	strb r3, [sp, #5]
	strb r2, [sp, #3]
	strb r1, [sp, #4]
	str r0, [sp, #0xc]
	b _020879A8
_0208793C:
	ldrb r1, [sp, #4]
	cmp r1, #3
	moveq r0, #5
	streqb r0, [sp, #4]
	beq _020879A8
	ldrb r0, [sp, #2]
	cmp r0, #0
	cmpeq r1, #0
	movne r0, #0xff
	strneb r0, [sp, #5]
	b _020879A8
_02087968:
	ldrb r0, [sp, #4]
	cmp r0, #3
	moveq r0, #5
	streqb r0, [sp, #4]
	beq _020879A8
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sp, #5]
	b _020879A8
_0208798C:
	ldrb r0, [sp, #4]
	cmp r0, #9
	moveq r0, #0xff
	streqb r0, [sp, #5]
	b _020879A8
_020879A0:
	mov r0, #0xff
	strb r0, [sp, #5]
_020879A8:
	add r0, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add r0, ip, #1
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020879C0: .word _020AEDB0
_020879C4: .word 0x000001FD
	arm_func_end sub_02087438

	arm_func_start sub_020879C8
sub_020879C8: ; 0x020879C8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	movs sl, r0
	mov r0, #0
	mov r5, r1
	str r0, [sp, #0xc]
	ldr r7, [sp, #0x4c]
	mov r6, r0
	strb r0, [r5, #-1]!
	ldrb r0, [sp, #0x43]
	str r1, [sp]
	ldrb r8, [sp, #0x45]
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	ldrb fp, [sp, #0x41]
	str r0, [sp, #8]
	cmpeq r7, #0
	bne _02087A3C
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02087A28
	cmp r8, #0x6f
	beq _02087A3C
_02087A28:
	add sp, sp, #0x10
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_02087A3C:
	cmp r8, #0x69
	bgt _02087A64
	bge _02087A98
	cmp r8, #0x58
	bgt _02087A58
	beq _02087AC4
	b _02087ACC
_02087A58:
	cmp r8, #0x64
	beq _02087A98
	b _02087ACC
_02087A64:
	cmp r8, #0x6f
	bgt _02087A78
	moveq r4, #8
	moveq fp, #0
	b _02087ACC
_02087A78:
	cmp r8, #0x78
	bgt _02087ACC
	cmp r8, #0x75
	blt _02087ACC
	beq _02087AB8
	cmp r8, #0x78
	beq _02087AC4
	b _02087ACC
_02087A98:
	cmp sl, #0
	mov r4, #0xa
	bge _02087ACC
	mov r0, #1
	cmp sl, #0x80000000
	rsbne sl, sl, #0
	str r0, [sp, #0xc]
	b _02087ACC
_02087AB8:
	mov r4, #0xa
	mov fp, #0
	b _02087ACC
_02087AC4:
	mov r4, #0x10
	mov fp, #0
_02087ACC:
	mov r0, sl
	mov r1, r4
	bl _u32_div_f
	mov sb, r1
	mov r0, sl
	mov r1, r4
	bl _u32_div_f
	cmp sb, #0xa
	mov sl, r0
	addlt sb, sb, #0x30
	blt _02087B04
	cmp r8, #0x78
	addeq sb, sb, #0x57
	addne sb, sb, #0x37
_02087B04:
	cmp sl, #0
	strb sb, [r5, #-1]!
	add r6, r6, #1
	bne _02087ACC
	cmp r4, #8
	bne _02087B38
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrnesb r0, [r5]
	cmpne r0, #0x30
	movne r0, #0x30
	strneb r0, [r5, #-1]!
	addne r6, r6, #1
_02087B38:
	ldrb r0, [sp, #0x40]
	cmp r0, #2
	bne _02087B6C
	ldr r0, [sp, #0xc]
	ldr r7, [sp, #8]
	cmp r0, #0
	cmpeq fp, #0
	subne r7, r7, #1
	cmp r4, #0x10
	bne _02087B6C
	ldr r0, [sp, #4]
	cmp r0, #0
	subne r7, r7, #2
_02087B6C:
	ldr r0, [sp]
	sub r1, r0, r5
	ldr r0, _02087C10 ; =0x000001FD
	add r1, r7, r1
	cmp r1, r0
	addgt sp, sp, #0x10
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	cmp r6, r7
	bge _02087BB0
	mov r0, #0x30
_02087BA0:
	add r6, r6, #1
	cmp r6, r7
	strb r0, [r5, #-1]!
	blt _02087BA0
_02087BB0:
	cmp r4, #0x10
	bne _02087BCC
	ldr r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x30
	strneb r8, [r5, #-1]
	strneb r0, [r5, #-2]!
_02087BCC:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r5, #-1]!
	bne _02087BFC
	cmp fp, #1
	moveq r0, #0x2b
	streqb r0, [r5, #-1]!
	beq _02087BFC
	cmp fp, #2
	moveq r0, #0x20
	streqb r0, [r5, #-1]!
_02087BFC:
	mov r0, r5
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02087C10: .word 0x000001FD
	arm_func_end sub_020879C8

	arm_func_start sub_02087C14
sub_02087C14: ; 0x02087C14
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov sb, r1
	mov r1, #0
	mov sl, r0
	mov r8, r2
	mov r0, r1
	strb r0, [r8, #-1]!
	ldr r0, [sp, #0x58]
	cmp sb, #0
	str r0, [sp, #0x14]
	ldrb r0, [sp, #0x4f]
	cmpeq sl, #0
	str r2, [sp]
	str r0, [sp, #4]
	ldrb r0, [sp, #0x51]
	str r1, [sp, #0x18]
	mov fp, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0x54]
	str r0, [sp, #0xc]
	ldrb r0, [sp, #0x4d]
	str r0, [sp, #0x10]
	ldreq r0, [sp, #0x14]
	cmpeq r0, #0
	bne _02087CAC
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02087C98
	ldr r0, [sp, #8]
	cmp r0, #0x6f
	beq _02087CAC
_02087C98:
	add sp, sp, #0x1c
	mov r0, r8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_02087CAC:
	ldr r0, [sp, #8]
	cmp r0, #0x69
	bgt _02087CD8
	bge _02087D08
	cmp r0, #0x58
	bgt _02087CCC
	beq _02087D5C
	b _02087D68
_02087CCC:
	cmp r0, #0x64
	beq _02087D08
	b _02087D68
_02087CD8:
	cmp r0, #0x6f
	bgt _02087CE8
	beq _02087D3C
	b _02087D68
_02087CE8:
	cmp r0, #0x78
	bgt _02087D68
	cmp r0, #0x75
	blt _02087D68
	beq _02087D4C
	cmp r0, #0x78
	beq _02087D5C
	b _02087D68
_02087D08:
	subs r0, sl, #0
	sbcs r0, sb, #0
	mov r7, #0xa
	mov r6, #0
	bge _02087D68
	cmp sb, #0x80000000
	cmpeq sl, r6
	beq _02087D30
	rsbs sl, sl, #0
	rsc sb, sb, #0
_02087D30:
	mov r0, #1
	str r0, [sp, #0x18]
	b _02087D68
_02087D3C:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #8
	b _02087D68
_02087D4C:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #0xa
	b _02087D68
_02087D5C:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #0x10
_02087D68:
	mov r4, #0
_02087D6C:
	mov r0, sl
	mov r1, sb
	mov r2, r7
	mov r3, r6
	bl _ull_mod
	mov r5, r0
	mov r0, sl
	mov r1, sb
	mov r2, r7
	mov r3, r6
	bl _ll_udiv
	mov sl, r0
	cmp r5, #0xa
	mov sb, r1
	addlt r0, r5, #0x30
	blt _02087DBC
	ldr r0, [sp, #8]
	cmp r0, #0x78
	addeq r0, r5, #0x57
	addne r0, r5, #0x37
_02087DBC:
	strb r0, [r8, #-1]!
	mov r0, #0
	cmp sb, r0
	cmpeq sl, r4
	add fp, fp, #1
	bne _02087D6C
	cmp r6, #0
	cmpeq r7, #8
	bne _02087DFC
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrnesb r0, [r8]
	cmpne r0, #0x30
	movne r0, #0x30
	strneb r0, [r8, #-1]!
	addne fp, fp, #1
_02087DFC:
	ldrb r0, [sp, #0x4c]
	cmp r0, #2
	bne _02087E4C
	ldr r0, [sp, #0xc]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldreq r0, [sp, #0x10]
	cmpeq r0, #0
	ldrne r0, [sp, #0x14]
	subne r0, r0, #1
	strne r0, [sp, #0x14]
	cmp r6, #0
	cmpeq r7, #0x10
	bne _02087E4C
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrne r0, [sp, #0x14]
	subne r0, r0, #2
	strne r0, [sp, #0x14]
_02087E4C:
	ldr r0, [sp]
	ldr r1, _02087F0C ; =0x000001FD
	sub r2, r0, r8
	ldr r0, [sp, #0x14]
	add r0, r0, r2
	cmp r0, r1
	addgt sp, sp, #0x1c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	ldr r0, [sp, #0x14]
	cmp fp, r0
	bge _02087E9C
	mov r1, #0x30
_02087E88:
	ldr r0, [sp, #0x14]
	add fp, fp, #1
	cmp fp, r0
	strb r1, [r8, #-1]!
	blt _02087E88
_02087E9C:
	cmp r6, #0
	cmpeq r7, #0x10
	bne _02087EC4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02087EC4
	ldr r0, [sp, #8]
	mov r1, #0x30
	strb r0, [r8, #-1]
	strb r1, [r8, #-2]!
_02087EC4:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _02087EF8
	ldr r0, [sp, #0x10]
	cmp r0, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _02087EF8
	cmp r0, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
_02087EF8:
	mov r0, r8
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02087F0C: .word 0x000001FD
	arm_func_end sub_02087C14

	arm_func_start sub_02087F10
sub_02087F10: ; 0x02087F10
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x44
	ldr r7, [sp, #0x80]
	ldr r0, _020883C0 ; =0x000001FD
	mov r8, r2
	cmp r7, r0
	ldrb r6, [sp, #0x79]
	ldrb r5, [sp, #0x77]
	ldrb r4, [sp, #0x75]
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x6c]
	addgt sp, sp, #0x44
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addgt sp, sp, #0x10
	bxgt lr
	mov sl, #0
	mov sb, #0x20
	add r0, sp, #8
	add r3, sp, #0xc
	strb sl, [sp, #8]
	strh sb, [sp, #0xa]
	bl sub_0208D638
	ldr r0, [sp, #0x68]
	ldr r1, [sp, #0x6c]
	bl sub_0208C5B4
	mov r2, r0
	mov r0, sl
	mov r3, r1
	mov r1, r0
	bl _deq
	bne _02087FDC
	ldr r3, _020883C4 ; =_020B31E4
	sub r0, r8, #6
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	add sp, sp, #0x44
	strb r2, [r8, #-6]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r2, [r3, #4]
	ldrb r1, [r3, #5]
	strb r2, [r0, #4]
	strb r1, [r0, #5]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_02087FDC:
	ldrb r0, [sp, #0x11]
	cmp r0, #0x49
	bne _020880EC
	ldrsb r0, [sp, #0xc]
	cmp r0, #0
	beq _02088078
	cmp r6, #0x41
	sub r0, r8, #5
	bne _0208803C
	ldr r3, _020883C8 ; =_020B31EC
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_0208803C:
	ldr r3, _020883CC ; =_020B31F4
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_02088078:
	cmp r6, #0x41
	sub r0, r8, #4
	bne _020880B8
	ldr r3, _020883D0 ; =_020B31FC
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020880B8:
	ldr r3, _020883D4 ; =_020B3200
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020880EC:
	cmp r0, #0x4e
	bne _020881F8
	ldrsb r0, [sp, #0xc]
	cmp r0, #0
	beq _02088184
	cmp r6, #0x41
	sub r0, r8, #5
	bne _02088148
	ldr r3, _020883D8 ; =_020B3204
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_02088148:
	ldr r3, _020883DC ; =_020B320C
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_02088184:
	cmp r6, #0x41
	sub r0, r8, #4
	bne _020881C4
	ldr r3, _020883E0 ; =_020B3214
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020881C4:
	ldr r3, _020883E4 ; =_020B3218
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020881F8:
	mov r3, sl
	mov r1, #1
	mov r0, #0x64
	add sb, sp, #0x68
	strb r1, [sp, #0x34]
	strb r1, [sp, #0x35]
	strb r3, [sp, #0x36]
	strb r3, [sp, #0x37]
	strb r3, [sp, #0x38]
	str r3, [sp, #0x3c]
	str r1, [sp, #0x40]
	strb r0, [sp, #0x39]
_02088228:
	rsb r1, r3, #7
	ldrsb r2, [sb, r3]
	ldrsb r0, [sb, r1]
	strb r0, [sb, r3]
	add r3, r3, #1
	strb r2, [sb, r1]
	cmp r3, #4
	blt _02088228
	ldrb r0, [sp, #0x69]
	ldrb r1, [sp, #0x68]
	ldr sb, _020883E8 ; =0x000007FF
	mov r0, r0, lsl #0x11
	orr r1, r0, r1, lsl #25
	add r0, sp, #0x34
	and lr, sb, r1, lsr #21
	sub ip, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	rsb r0, sb, #0x400
	mov r1, r8
	add r0, lr, r0
	ldmia ip, {r2, r3}
	bl sub_020879C8
	cmp r6, #0x61
	moveq r1, #0x70
	movne r1, #0x50
	strb r1, [r0, #-1]!
	mov r1, r7, lsl #2
	mov lr, r7
	cmp r7, #1
	add r8, r1, #0xb
	add ip, sp, #0x68
	blt _02088338
	mov sb, #0x30
_020882B0:
	cmp r8, #0x40
	bge _02088320
	ldrb r1, [ip, r8, asr #3]
	and r2, r8, #7
	rsb r3, r2, #7
	mov r2, r1, asr r3
	sub sl, r8, #4
	bic r1, r8, #7
	bic sl, sl, #7
	cmp r1, sl
	add sl, ip, r8, asr #3
	and r1, r2, #0xff
	beq _020882F4
	ldrb r2, [sl, #-1]
	mov r2, r2, lsl #8
	orr r1, r1, r2, asr r3
	and r1, r1, #0xff
_020882F4:
	and r1, r1, #0xf
	cmp r1, #0xa
	addlo r1, r1, #0x30
	andlo r1, r1, #0xff
	blo _02088324
	cmp r6, #0x61
	addeq r1, r1, #0x57
	andeq r1, r1, #0xff
	addne r1, r1, #0x37
	andne r1, r1, #0xff
	b _02088324
_02088320:
	mov r1, sb
_02088324:
	sub lr, lr, #1
	cmp lr, #1
	strb r1, [r0, #-1]!
	sub r8, r8, #4
	bge _020882B0
_02088338:
	cmp r7, #0
	cmpeq r5, #0
	movne r1, #0x2e
	strneb r1, [r0, #-1]!
	mov r1, #0x31
	strb r1, [r0, #-1]
	cmp r6, #0x61
	moveq r1, #0x78
	movne r1, #0x58
	strb r1, [r0, #-2]!
	mov r1, #0x30
	strb r1, [r0, #-1]!
	ldrsb r1, [sp, #0xc]
	cmp r1, #0
	movne r1, #0x2d
	strneb r1, [r0, #-1]!
	addne sp, sp, #0x44
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addne sp, sp, #0x10
	bxne lr
	cmp r4, #1
	moveq r1, #0x2b
	streqb r1, [r0, #-1]!
	addeq sp, sp, #0x44
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addeq sp, sp, #0x10
	bxeq lr
	cmp r4, #2
	moveq r1, #0x20
	streqb r1, [r0, #-1]!
	add sp, sp, #0x44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020883C0: .word 0x000001FD
_020883C4: .word _020B31E4
_020883C8: .word _020B31EC
_020883CC: .word _020B31F4
_020883D0: .word _020B31FC
_020883D4: .word _020B3200
_020883D8: .word _020B3204
_020883DC: .word _020B320C
_020883E0: .word _020B3214
_020883E4: .word _020B3218
_020883E8: .word 0x000007FF
	arm_func_end sub_02087F10

	arm_func_start sub_020883EC
sub_020883EC: ; 0x020883EC
	stmdb sp!, {r4, lr}
	cmp r1, #0
	bge _02088414
_020883F8:
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #1
	strb r1, [r0, #4]
	mov r1, #0x30
	strb r1, [r0, #5]
	ldmia sp!, {r4, pc}
_02088414:
	ldrb lr, [r0, #4]
	cmp r1, lr
	ldmgeia sp!, {r4, pc}
	add ip, r0, #5
	add r2, ip, r1
	add r2, r2, #1
	ldrsb r3, [r2, #-1]!
	sub r3, r3, #0x30
	mov r3, r3, lsl #0x18
	mov r3, r3, asr #0x18
	cmp r3, #5
	bne _02088474
	add ip, ip, lr
_02088448:
	sub ip, ip, #1
	cmp ip, r2
	bls _02088460
	ldrsb r3, [ip]
	cmp r3, #0x30
	beq _02088448
_02088460:
	cmp ip, r2
	ldreqsb r3, [r2, #-1]
	andeq r4, r3, #1
	movne r4, #1
	b _0208847C
_02088474:
	movgt r4, #1
	movle r4, #0
_0208847C:
	cmp r1, #0
	beq _020884D8
	mov ip, #0
	mov lr, #1
_0208848C:
	ldrsb r3, [r2, #-1]!
	sub r3, r3, #0x30
	add r3, r3, r4
	mov r3, r3, lsl #0x18
	mov r3, r3, asr #0x18
	cmp r3, #9
	movgt r4, lr
	movle r4, ip
	cmp r4, #0
	bne _020884BC
	cmp r3, #0
	bne _020884C4
_020884BC:
	sub r1, r1, #1
	b _020884D0
_020884C4:
	add r3, r3, #0x30
	strb r3, [r2]
	b _020884D8
_020884D0:
	cmp r1, #0
	bne _0208848C
_020884D8:
	cmp r4, #0
	beq _02088500
	ldrsh r3, [r0, #2]
	mov r2, #1
	mov r1, #0x31
	add r3, r3, #1
	strh r3, [r0, #2]
	strb r2, [r0, #4]
	strb r1, [r0, #5]
	ldmia sp!, {r4, pc}
_02088500:
	cmp r1, #0
	beq _020883F8
	strb r1, [r0, #4]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020883EC

	arm_func_start sub_02088510
sub_02088510: ; 0x02088510
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r7, [sp, #0x68]
	ldr r3, _02088C48 ; =0x000001FD
	ldrb r6, [sp, #0x61]
	ldrb r5, [sp, #0x5f]
	ldrb r4, [sp, #0x5d]
	cmp r7, r3
	mov sl, r0
	mov r8, r1
	mov sb, r2
	addgt sp, sp, #0x2c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	mov ip, #0
	mov fp, #0x20
	add r0, sp, #0
	add r3, sp, #4
	mov r1, sl
	mov r2, r8
	strb ip, [sp]
	strh fp, [sp, #2]
	bl sub_0208D638
	ldrb r0, [sp, #8]
	add r1, sp, #9
	add r0, r1, r0
	b _020885A0
_02088588:
	ldrb r2, [sp, #8]
	ldrsh r1, [sp, #6]
	sub r2, r2, #1
	add r1, r1, #1
	strb r2, [sp, #8]
	strh r1, [sp, #6]
_020885A0:
	ldrb r1, [sp, #8]
	cmp r1, #1
	bls _020885B8
	ldrsb r1, [r0, #-1]!
	cmp r1, #0x30
	beq _02088588
_020885B8:
	ldrb r0, [sp, #9]
	cmp r0, #0x30
	beq _020885D8
	cmp r0, #0x49
	beq _020885E4
	cmp r0, #0x4e
	beq _02088744
	b _02088898
_020885D8:
	mov r0, #0
	strh r0, [sp, #6]
	b _02088898
_020885E4:
	mov r2, #0
	mov r0, sl
	mov r1, r8
	mov r3, r2
	bl _dls
	bhs _020886A8
	cmp r6, #0
	sub r0, sb, #5
	blt _02088610
	cmp r6, #0x80
	blt _02088618
_02088610:
	mov r1, #0
	b _02088628
_02088618:
	ldr r1, _02088C4C ; =_020AEDB0
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_02088628:
	cmp r1, #0
	beq _0208866C
	ldr r3, _02088C50 ; =_020B31EC
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208866C:
	ldr r3, _02088C54 ; =_020B31F4
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020886A8:
	cmp r6, #0
	sub r0, sb, #4
	blt _020886BC
	cmp r6, #0x80
	blt _020886C4
_020886BC:
	mov r1, #0
	b _020886D4
_020886C4:
	ldr r1, _02088C4C ; =_020AEDB0
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_020886D4:
	cmp r1, #0
	beq _02088710
	ldr r3, _02088C58 ; =_020B31FC
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_02088710:
	ldr r3, _02088C5C ; =_020B3200
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_02088744:
	ldrsb r0, [sp, #4]
	cmp r0, #0
	beq _020887FC
	cmp r6, #0
	sub r0, sb, #5
	blt _02088764
	cmp r6, #0x80
	blt _0208876C
_02088764:
	mov r1, #0
	b _0208877C
_0208876C:
	ldr r1, _02088C4C ; =_020AEDB0
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_0208877C:
	cmp r1, #0
	beq _020887C0
	ldr r3, _02088C60 ; =_020B3204
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020887C0:
	ldr r3, _02088C64 ; =_020B320C
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020887FC:
	cmp r6, #0
	sub r0, sb, #4
	blt _02088810
	cmp r6, #0x80
	blt _02088818
_02088810:
	mov r1, #0
	b _02088828
_02088818:
	ldr r1, _02088C4C ; =_020AEDB0
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_02088828:
	cmp r1, #0
	beq _02088864
	ldr r3, _02088C68 ; =_020B3214
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_02088864:
	ldr r3, _02088C6C ; =_020B3218
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_02088898:
	ldrb r0, [sp, #8]
	ldrsh r1, [sp, #6]
	sub r8, sb, #1
	sub r0, r0, #1
	add r0, r1, r0
	strh r0, [sp, #6]
	mov r0, #0
	strb r0, [r8]
	cmp r6, #0x65
	bgt _020888EC
	bge _02088978
	cmp r6, #0x47
	bgt _02088C34
	cmp r6, #0x45
	blt _02088C34
	beq _02088978
	cmp r6, #0x46
	beq _02088AC0
	cmp r6, #0x47
	beq _02088904
	b _02088C34
_020888EC:
	cmp r6, #0x66
	bgt _020888FC
	beq _02088AC0
	b _02088C34
_020888FC:
	cmp r6, #0x67
	bne _02088C34
_02088904:
	ldrb r0, [sp, #8]
	cmp r0, r7
	ble _0208891C
	add r0, sp, #4
	mov r1, r7
	bl sub_020883EC
_0208891C:
	ldrsh r2, [sp, #6]
	mvn r0, #3
	cmp r2, r0
	blt _02088934
	cmp r2, r7
	blt _02088954
_02088934:
	cmp r5, #0
	ldreqb r0, [sp, #8]
	subne r7, r7, #1
	subeq r7, r0, #1
	cmp r6, #0x67
	moveq r6, #0x65
	movne r6, #0x45
	b _02088978
_02088954:
	cmp r5, #0
	addne r0, r2, #1
	subne r7, r7, r0
	bne _02088AC0
	ldrb r1, [sp, #8]
	add r0, r2, #1
	subs r7, r1, r0
	movmi r7, #0
	b _02088AC0
_02088978:
	ldrb r0, [sp, #8]
	add r1, r7, #1
	cmp r0, r1
	ble _02088990
	add r0, sp, #4
	bl sub_020883EC
_02088990:
	ldrsh lr, [sp, #6]
	mov fp, #0x2b
	mov sl, #0
	cmp lr, #0
	rsblt lr, lr, #0
	movlt fp, #0x2d
	ldr r3, _02088C70 ; =0x66666667
	mov r0, #0xa
	b _020889E4
_020889B4:
	mov r1, lr, lsr #0x1f
	smull r2, ip, r3, lr
	add ip, r1, ip, asr #2
	smull r1, r2, r0, ip
	sub ip, lr, r1
	add r1, ip, #0x30
	strb r1, [r8, #-1]!
	mov r2, lr
	smull r1, lr, r3, r2
	mov r1, r2, lsr #0x1f
	add lr, r1, lr, asr #2
	add sl, sl, #1
_020889E4:
	cmp lr, #0
	bne _020889B4
	cmp sl, #2
	blt _020889B4
	strb fp, [r8, #-1]
	strb r6, [r8, #-2]!
	sub r1, sb, r8
	ldr r0, _02088C48 ; =0x000001FD
	add r1, r7, r1
	cmp r1, r0
	addgt sp, sp, #0x2c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	ldrb r1, [sp, #8]
	add r0, r7, #1
	cmp r1, r0
	bge _02088A50
	add r0, r7, #2
	sub r0, r0, r1
	subs r1, r0, #1
	beq _02088A50
	mov r0, #0x30
_02088A44:
	strb r0, [r8, #-1]!
	subs r1, r1, #1
	bne _02088A44
_02088A50:
	ldrb r1, [sp, #8]
	add r0, sp, #9
	add r2, r0, r1
	subs r1, r1, #1
	beq _02088A74
_02088A64:
	ldrsb r0, [r2, #-1]!
	subs r1, r1, #1
	strb r0, [r8, #-1]!
	bne _02088A64
_02088A74:
	cmp r7, #0
	cmpeq r5, #0
	movne r0, #0x2e
	strneb r0, [r8, #-1]!
	ldrb r0, [sp, #9]
	strb r0, [r8, #-1]!
	ldrsb r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _02088C34
	cmp r4, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _02088C34
	cmp r4, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
	b _02088C34
_02088AC0:
	ldrsh r3, [sp, #6]
	ldrb r2, [sp, #8]
	sub r0, r2, r3
	subs r1, r0, #1
	movmi r1, #0
	cmp r1, r7
	ble _02088B00
	sub r1, r1, r7
	add r0, sp, #4
	sub r1, r2, r1
	bl sub_020883EC
	ldrsh r3, [sp, #6]
	ldrb r2, [sp, #8]
	sub r0, r2, r3
	subs r1, r0, #1
	movmi r1, #0
_02088B00:
	adds r0, r3, #1
	movmi r0, #0
	ldr r3, _02088C48 ; =0x000001FD
	add r6, r0, r1
	cmp r6, r3
	addgt sp, sp, #0x2c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	add r3, sp, #9
	sub r6, r7, r1
	cmp r6, #0
	add r2, r3, r2
	mov sb, #0
	ble _02088B54
	mov r3, #0x30
_02088B44:
	add sb, sb, #1
	cmp sb, r6
	strb r3, [r8, #-1]!
	blt _02088B44
_02088B54:
	mov r6, #0
	b _02088B68
_02088B5C:
	ldrsb r3, [r2, #-1]!
	add r6, r6, #1
	strb r3, [r8, #-1]!
_02088B68:
	cmp r6, r1
	ldrltb r3, [sp, #8]
	cmplt r6, r3
	blt _02088B5C
	cmp r6, r1
	bge _02088B94
	mov r3, #0x30
_02088B84:
	add r6, r6, #1
	cmp r6, r1
	strb r3, [r8, #-1]!
	blt _02088B84
_02088B94:
	cmp r7, #0
	cmpeq r5, #0
	movne r1, #0x2e
	strneb r1, [r8, #-1]!
	cmp r0, #0
	beq _02088BFC
	ldrb r1, [sp, #8]
	mov r5, #0
	sub r1, r0, r1
	cmp r1, #0
	ble _02088BDC
	mov r3, #0x30
_02088BC4:
	strb r3, [r8, #-1]!
	ldrb r1, [sp, #8]
	add r5, r5, #1
	sub r1, r0, r1
	cmp r5, r1
	blt _02088BC4
_02088BDC:
	cmp r5, r0
	bge _02088C04
_02088BE4:
	ldrsb r1, [r2, #-1]!
	add r5, r5, #1
	cmp r5, r0
	strb r1, [r8, #-1]!
	blt _02088BE4
	b _02088C04
_02088BFC:
	mov r0, #0x30
	strb r0, [r8, #-1]!
_02088C04:
	ldrsb r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _02088C34
	cmp r4, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _02088C34
	cmp r4, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
_02088C34:
	mov r0, r8
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02088C48: .word 0x000001FD
_02088C4C: .word _020AEDB0
_02088C50: .word _020B31EC
_02088C54: .word _020B31F4
_02088C58: .word _020B31FC
_02088C5C: .word _020B3200
_02088C60: .word _020B3204
_02088C64: .word _020B320C
_02088C68: .word _020B3214
_02088C6C: .word _020B3218
_02088C70: .word 0x66666667
	arm_func_end sub_02088510

	arm_func_start __vsprintf_internal_slice
__vsprintf_internal_slice: ; 0x02088C74
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x22c
	mov r3, #0x20
	mov fp, r2
	strb r3, [sp, #0x19]
	ldrsb r2, [fp]
	mov sb, r0
	mov r8, r1
	cmp r2, #0
	mov sl, #0
	beq _0208947C
_02088CA4:
	mov r0, fp
	mov r1, #0x25
	bl strchr
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _02088CF8
	mov r0, fp
	bl strlen
	movs r2, r0
	add sl, sl, r2
	beq _0208947C
	mov r0, r8
	mov r1, fp
	blx sb
	cmp r0, #0
	bne _0208947C
	add sp, sp, #0x22c
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_02088CF8:
	subs r2, r0, fp
	add sl, sl, r2
	beq _02088D28
	mov r0, r8
	mov r1, fp
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_02088D28:
	ldr r0, [sp, #0xc]
	add r1, sp, #0x25c
	add r2, sp, #0x1c
	bl sub_02087438
	ldrb r1, [sp, #0x21]
	mov fp, r0
	cmp r1, #0x61
	bgt _02088D94
	bge _020890F8
	cmp r1, #0x47
	bgt _02088D88
	subs r0, r1, #0x41
	addpl pc, pc, r0, lsl #2
	b _02088D7C
_02088D60: ; jump table
	b _020890F8 ; case 0
	b _020892E0 ; case 1
	b _020892E0 ; case 2
	b _020892E0 ; case 3
	b _02089090 ; case 4
	b _02089090 ; case 5
	b _02089090 ; case 6
_02088D7C:
	cmp r1, #0x25
	beq _020892CC
	b _020892E0
_02088D88:
	cmp r1, #0x58
	beq _02088F54
	b _020892E0
_02088D94:
	cmp r1, #0x75
	bgt _02088DFC
	subs r0, r1, #0x64
	addpl pc, pc, r0, lsl #2
	b _02088DF0
_02088DA8: ; jump table
	b _02088E14 ; case 0
	b _02089090 ; case 1
	b _02089090 ; case 2
	b _02089090 ; case 3
	b _020892E0 ; case 4
	b _02088E14 ; case 5
	b _020892E0 ; case 6
	b _020892E0 ; case 7
	b _020892E0 ; case 8
	b _020892E0 ; case 9
	b _02089220 ; case 10
	b _02088F54 ; case 11
	b _020892E0 ; case 12
	b _020892E0 ; case 13
	b _020892E0 ; case 14
	b _02089160 ; case 15
	b _020892E0 ; case 16
	b _02088F54 ; case 17
_02088DF0:
	cmp r1, #0x63
	beq _020892AC
	b _020892E0
_02088DFC:
	cmp r1, #0x78
	bgt _02088E0C
	beq _02088F54
	b _020892E0
_02088E0C:
	cmp r1, #0xff
	b _020892E0
_02088E14:
	ldrb r0, [sp, #0x20]
	cmp r0, #3
	bne _02088E34
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _02088ECC
_02088E34:
	cmp r0, #4
	bne _02088E5C
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _02088ECC
_02088E5C:
	cmp r0, #6
	bne _02088E84
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _02088ECC
_02088E84:
	cmp r0, #7
	bne _02088EA0
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _02088ECC
_02088EA0:
	cmp r0, #8
	bne _02088EBC
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _02088ECC
_02088EBC:
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
_02088ECC:
	cmp r0, #2
	moveq r1, r5, lsl #0x10
	moveq r5, r1, asr #0x10
	cmp r0, #1
	moveq r1, r5, lsl #0x18
	moveq r5, r1, asr #0x18
	cmp r0, #4
	cmpne r0, #6
	add r0, sp, #0x1c
	bne _02088F20
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x22c
	bl sub_02087C14
	movs r7, r0
	beq _020892E0
	b _02088F44
_02088F20:
	sub r4, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	add r1, sp, #0x22c
	mov r0, r5
	ldmia r4, {r2, r3}
	bl sub_020879C8
	movs r7, r0
	beq _020892E0
_02088F44:
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _0208932C
_02088F54:
	ldrb r0, [sp, #0x20]
	cmp r0, #3
	bne _02088F74
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _0208900C
_02088F74:
	cmp r0, #4
	bne _02088F9C
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _0208900C
_02088F9C:
	cmp r0, #6
	bne _02088FC4
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _0208900C
_02088FC4:
	cmp r0, #7
	bne _02088FE0
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _0208900C
_02088FE0:
	cmp r0, #8
	bne _02088FFC
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _0208900C
_02088FFC:
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
_0208900C:
	cmp r0, #2
	moveq r1, r5, lsl #0x10
	moveq r5, r1, lsr #0x10
	cmp r0, #1
	andeq r5, r5, #0xff
	cmp r0, #4
	cmpne r0, #6
	add r0, sp, #0x1c
	bne _0208905C
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x22c
	bl sub_02087C14
	movs r7, r0
	beq _020892E0
	b _02089080
_0208905C:
	sub r4, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	add r1, sp, #0x22c
	mov r0, r5
	ldmia r4, {r2, r3}
	bl sub_020879C8
	movs r7, r0
	beq _020892E0
_02089080:
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _0208932C
_02089090:
	ldrb r0, [sp, #0x20]
	cmp r0, #9
	ldrne r0, [sp, #0x25c]
	addne r0, r0, #8
	strne r0, [sp, #0x25c]
	bne _020890B4
	ldr r0, [sp, #0x25c]
	add r0, r0, #8
	str r0, [sp, #0x25c]
_020890B4:
	ldr r7, [r0, #-8]
	ldr r6, [r0, #-4]
	add r0, sp, #0x1c
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	mov r0, r7
	mov r1, r6
	add r2, sp, #0x22c
	bl sub_02088510
	movs r7, r0
	beq _020892E0
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _0208932C
_020890F8:
	ldrb r0, [sp, #0x20]
	cmp r0, #9
	ldrne r0, [sp, #0x25c]
	addne r0, r0, #8
	strne r0, [sp, #0x25c]
	bne _0208911C
	ldr r0, [sp, #0x25c]
	add r0, r0, #8
	str r0, [sp, #0x25c]
_0208911C:
	ldr r7, [r0, #-8]
	ldr r6, [r0, #-4]
	add r0, sp, #0x1c
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	mov r0, r7
	mov r1, r6
	add r2, sp, #0x22c
	bl sub_02087F10
	movs r7, r0
	beq _020892E0
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _0208932C
_02089160:
	ldrb r0, [sp, #0x20]
	cmp r0, #5
	bne _020891A0
	ldr r0, [sp, #0x25c]
	mov r2, #0x200
	add r0, r0, #4
	str r0, [sp, #0x25c]
	ldr r1, [r0, #-4]
	add r0, sp, #0x2c
	cmp r1, #0
	ldreq r1, _02089490 ; =_020B321C
	bl wcstombs
	cmp r0, #0
	blt _020892E0
	add r7, sp, #0x2c
	b _020891B0
_020891A0:
	ldr r0, [sp, #0x25c]
	add r0, r0, #4
	str r0, [sp, #0x25c]
	ldr r7, [r0, #-4]
_020891B0:
	ldrb r0, [sp, #0x1f]
	cmp r7, #0
	ldreq r7, _02089494 ; =_020B3220
	cmp r0, #0
	beq _020891E4
	ldrb r0, [sp, #0x1e]
	ldrb r6, [r7], #1
	cmp r0, #0
	beq _0208932C
	ldr r0, [sp, #0x28]
	cmp r6, r0
	movgt r6, r0
	b _0208932C
_020891E4:
	ldrb r0, [sp, #0x1e]
	cmp r0, #0
	beq _02089210
	ldr r6, [sp, #0x28]
	mov r0, r7
	mov r2, r6
	mov r1, #0
	bl memchr
	cmp r0, #0
	subne r6, r0, r7
	b _0208932C
_02089210:
	mov r0, r7
	bl strlen
	mov r6, r0
	b _0208932C
_02089220:
	ldr r1, [sp, #0x25c]
	ldrb r0, [sp, #0x20]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r1, [r1, #-4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _02089470
_02089240: ; jump table
	b _02089264 ; case 0
	b _02089470 ; case 1
	b _0208926C ; case 2
	b _02089274 ; case 3
	b _0208929C ; case 4
	b _02089470 ; case 5
	b _0208927C ; case 6
	b _0208928C ; case 7
	b _02089294 ; case 8
_02089264:
	str sl, [r1]
	b _02089470
_0208926C:
	strh sl, [r1]
	b _02089470
_02089274:
	str sl, [r1]
	b _02089470
_0208927C:
	str sl, [r1]
	mov r0, sl, asr #0x1f
	str r0, [r1, #4]
	b _02089470
_0208928C:
	str sl, [r1]
	b _02089470
_02089294:
	str sl, [r1]
	b _02089470
_0208929C:
	str sl, [r1]
	mov r0, sl, asr #0x1f
	str r0, [r1, #4]
	b _02089470
_020892AC:
	ldr r0, [sp, #0x25c]
	add r7, sp, #0x2c
	add r0, r0, #4
	str r0, [sp, #0x25c]
	ldr r0, [r0, #-4]
	mov r6, #1
	strb r0, [sp, #0x2c]
	b _0208932C
_020892CC:
	mov r0, #0x25
	strb r0, [sp, #0x2c]
	add r7, sp, #0x2c
	mov r6, #1
	b _0208932C
_020892E0:
	ldr r0, [sp, #0xc]
	bl strlen
	movs r4, r0
	beq _02089318
	ldr r1, [sp, #0xc]
	mov r0, r8
	mov r2, r4
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_02089318:
	add sp, sp, #0x22c
	add r0, sl, r4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208932C:
	ldrb r0, [sp, #0x1c]
	mov r4, r6
	cmp r0, #0
	beq _020893E0
	cmp r0, #2
	moveq r0, #0x30
	movne r0, #0x20
	strb r0, [sp, #0x19]
	ldrsb r0, [r7]
	cmp r0, #0x2b
	cmpne r0, #0x2d
	cmpne r0, #0x20
	bne _0208939C
	ldrsb r0, [sp, #0x19]
	cmp r0, #0x30
	bne _0208939C
	mov r0, r8
	mov r1, r7
	mov r2, #1
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	add r7, r7, #1
	sub r6, r6, #1
_0208939C:
	ldr r0, [sp, #0x24]
	cmp r4, r0
	bge _020893E0
_020893A8:
	mov r0, r8
	add r1, sp, #0x19
	mov r2, #1
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #0x24]
	add r4, r4, #1
	cmp r4, r0
	blt _020893A8
_020893E0:
	cmp r6, #0
	beq _02089410
	mov r0, r8
	mov r1, r7
	mov r2, r6
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_02089410:
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	bne _0208946C
	ldr r0, [sp, #0x24]
	cmp r4, r0
	bge _0208946C
	mov r6, #0x20
	add r7, sp, #0x18
_02089430:
	mov r0, r8
	mov r1, r7
	mov r2, #1
	strb r6, [sp, #0x18]
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #0x24]
	add r4, r4, #1
	cmp r4, r0
	blt _02089430
_0208946C:
	add sl, sl, r4
_02089470:
	ldrsb r0, [fp]
	cmp r0, #0
	bne _02088CA4
_0208947C:
	mov r0, sl
	add sp, sp, #0x22c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_02089490: .word _020B321C
_02089494: .word _020B3220
	arm_func_end __vsprintf_internal_slice

	arm_func_start TryAppendToSlice
TryAppendToSlice: ; 0x02089498
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r3, [r4, #8]
	mov r5, r2
	ldr r2, [r4, #4]
	add r0, r3, r5
	cmp r0, r2
	ldr r0, [r4]
	subhi r5, r2, r3
	mov r2, r5
	add r0, r0, r3
	bl memcpy
	ldr r1, [r4, #8]
	mov r0, #1
	add r1, r1, r5
	str r1, [r4, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end TryAppendToSlice

	arm_func_start __vsprintf_internal
__vsprintf_internal: ; 0x020894DC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r4, r1
	mov ip, #0
	ldr r0, _02089540 ; =TryAppendToSlice
	add r1, sp, #0
	str r5, [sp]
	str r4, [sp, #4]
	str ip, [sp, #8]
	bl __vsprintf_internal_slice
	cmp r5, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, pc}
	cmp r0, r4
	movlo r1, #0
	addlo sp, sp, #0xc
	strlob r1, [r5, r0]
	ldmloia sp!, {r4, r5, pc}
	cmp r4, #0
	addne r1, r5, r4
	movne r2, #0
	strneb r2, [r1, #-1]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_02089540: .word TryAppendToSlice
	arm_func_end __vsprintf_internal

	arm_func_start vsprintf
vsprintf: ; 0x02089544
	ldr ip, _02089558 ; =__vsprintf_internal
	mov r3, r2
	mov r2, r1
	mvn r1, #0
	bx ip
	.align 2, 0
_02089558: .word __vsprintf_internal
	arm_func_end vsprintf

	arm_func_start snprintf
snprintf: ; 0x0208955C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r3, sp, #0x10
	bic r3, r3, #3
	ldr r2, [sp, #0x10]
	add r3, r3, #4
	bl __vsprintf_internal
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end snprintf

	arm_func_start sprintf
sprintf: ; 0x02089584
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	bic r1, r1, #3
	add r3, r1, #4
	ldr r2, [sp, #0xc]
	mvn r1, #0
	bl __vsprintf_internal
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sprintf

	arm_func_start sub_020895B0
sub_020895B0: ; 0x020895B0
	ldr r2, _020895D8 ; =_020B3224
	ldr r0, _020895DC ; =0x41C64E6D
	ldr r3, [r2]
	ldr r1, _020895E0 ; =0x00007FFF
	mul r0, r3, r0
	add r0, r0, #0x39
	add r0, r0, #0x3000
	str r0, [r2]
	and r0, r1, r0, lsr #16
	bx lr
	.align 2, 0
_020895D8: .word _020B3224
_020895DC: .word 0x41C64E6D
_020895E0: .word 0x00007FFF
	arm_func_end sub_020895B0

	arm_func_start sub_020895E4
sub_020895E4: ; 0x020895E4
	ldr r1, _020895F0 ; =_020B3224
	str r0, [r1]
	bx lr
	.align 2, 0
_020895F0: .word _020B3224
	arm_func_end sub_020895E4

	arm_func_start sub_020895F4
sub_020895F4: ; 0x020895F4
	cmp r2, #0
	beq _02089610
	cmp r2, #1
	beq _02089640
	cmp r2, #2
	beq _02089668
	b _02089670
_02089610:
	ldr r1, [r0]
	ldrsb r2, [r1]
	cmp r2, #0
	bne _02089630
	mov r1, #1
	str r1, [r0, #4]
	sub r0, r1, #2
	bx lr
_02089630:
	add r1, r1, #1
	str r1, [r0]
	and r0, r2, #0xff
	bx lr
_02089640:
	ldr r2, [r0, #4]
	cmp r2, #0
	movne r2, #0
	strne r2, [r0, #4]
	bne _02089660
	ldr r2, [r0]
	sub r2, r2, #1
	str r2, [r0]
_02089660:
	mov r0, r1
	bx lr
_02089668:
	ldr r0, [r0, #4]
	bx lr
_02089670:
	mov r0, #0
	bx lr
	arm_func_end sub_020895F4
