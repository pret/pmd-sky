	.include "asm/macros.inc"
	.include "main_020897DC.inc"

	.text

	arm_func_start strncat
strncat: ; 0x020897DC
	stmdb sp!, {r3, lr}
	mov ip, r0
_020897E4:
	ldrsb r3, [ip], #1
	cmp r3, #0
	bne _020897E4
	cmp r2, #0
	sub ip, ip, #1
	beq _02089820
_020897FC:
	ldrsb r3, [r1], #1
	mov lr, ip
	strb r3, [ip], #1
	ldrsb r3, [lr]
	cmp r3, #0
	subeq ip, ip, #1
	beq _02089820
	subs r2, r2, #1
	bne _020897FC
_02089820:
	mov r1, #0
	strb r1, [ip]
	ldmia sp!, {r3, pc}
	arm_func_end strncat

	arm_func_start strcmp
strcmp: ; 0x0208982C
	stmdb sp!, {r4, lr}
	ldrb r2, [r0]
	ldrb r3, [r1]
	subs r3, r2, r3
	movne r0, r3
	ldmneia sp!, {r4, pc}
	and r4, r0, #3
	and r3, r1, #3
	cmp r3, r4
	bne _02089908
	cmp r4, #0
	beq _020898A0
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	rsbs r4, r4, #3
	beq _02089898
_02089870:
	ldrb r3, [r0, #1]!
	ldrb r2, [r1, #1]!
	subs r2, r3, r2
	movne r0, r2
	ldmneia sp!, {r4, pc}
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	subs r4, r4, #1
	bne _02089870
_02089898:
	add r0, r0, #1
	add r1, r1, #1
_020898A0:
	ldr r2, [r0]
	ldr r3, _02089938 ; =0xFEFEFEFF
	mvn r4, r2
	add lr, r2, r3
	ldr ip, _0208993C ; =0x80808080
	and r4, lr, r4
	tst r4, ip
	ldr r4, [r1]
	bne _020898F4
	cmp r2, r4
	bne _020898E8
_020898CC:
	ldr r2, [r0, #4]!
	ldr r4, [r1, #4]!
	add lr, r2, r3
	tst lr, ip
	bne _020898F4
	cmp r2, r4
	beq _020898CC
_020898E8:
	sub r0, r0, #1
	sub r1, r1, #1
	b _02089908
_020898F4:
	ldrb r2, [r0]
	ldrb r3, [r1]
	subs r3, r2, r3
	movne r0, r3
	ldmneia sp!, {r4, pc}
_02089908:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_02089914:
	ldrb r3, [r0, #1]!
	ldrb r2, [r1, #1]!
	subs r2, r3, r2
	movne r0, r2
	ldmneia sp!, {r4, pc}
	cmp r3, #0
	bne _02089914
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_02089938: .word 0xFEFEFEFF
_0208993C: .word 0x80808080
	arm_func_end strcmp

	arm_func_start strncmp
strncmp: ; 0x02089940
	cmp r2, #0
	beq _0208996C
_02089948:
	ldrb ip, [r1], #1
	ldrb r3, [r0], #1
	cmp r3, ip
	subne r0, r3, ip
	bxne lr
	cmp r3, #0
	beq _0208996C
	subs r2, r2, #1
	bne _02089948
_0208996C:
	mov r0, #0
	bx lr
	arm_func_end strncmp

	arm_func_start strchr
strchr: ; 0x02089974
	ldrsb r2, [r0], #1
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	cmp r2, #0
	beq _020899A0
_02089988:
	cmp r2, r1
	subeq r0, r0, #1
	bxeq lr
	ldrsb r2, [r0], #1
	cmp r2, #0
	bne _02089988
_020899A0:
	cmp r1, #0
	movne r0, #0
	subeq r0, r0, #1
	bx lr
	arm_func_end strchr

	arm_func_start strcspn
strcspn: ; 0x020899B0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x20
	add ip, sp, #0
	mov r3, #8
	mov r2, #0
_020899C4:
	strb r2, [ip]
	strb r2, [ip, #1]
	strb r2, [ip, #2]
	strb r2, [ip, #3]
	add ip, ip, #4
	subs r3, r3, #1
	bne _020899C4
	ldrb r3, [r1]
	add r4, r1, #1
	cmp r3, #0
	beq _02089A20
	add lr, sp, #0
	mov r2, #1
_020899F8:
	and ip, r3, #0xff
	and r1, r3, #7
	mov r1, r2, lsl r1
	ldrb r3, [lr, ip, asr #3]
	and r1, r1, #0xff
	orr r1, r3, r1
	strb r1, [lr, ip, asr #3]
	ldrb r3, [r4], #1
	cmp r3, #0
	bne _020899F8
_02089A20:
	ldrb r1, [r0]
	add r4, r0, #1
	cmp r1, #0
	beq _02089A60
	add ip, sp, #0
	mov r2, #1
_02089A38:
	and r3, r1, #0xff
	and r1, r1, #7
	mov r1, r2, lsl r1
	ldrb r3, [ip, r3, asr #3]
	and r1, r1, #0xff
	tst r3, r1
	bne _02089A60
	ldrb r1, [r4], #1
	cmp r1, #0
	bne _02089A38
_02089A60:
	sub r0, r4, r0
	sub r0, r0, #1
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	arm_func_end strcspn

; https://decomp.me/scratch/QV4rQ
	arm_func_start strstr
strstr: ; 0x02089A70
	stmdb sp!, {r4, lr}
	cmp r1, #0
	ldrneb r2, [r1]
	cmpne r2, #0
	ldmeqia sp!, {r4, pc}
	ldrb r3, [r0]
	add r4, r0, #1
	cmp r3, #0
	beq _02089AD4
_02089A94:
	cmp r3, r2
	bne _02089AC8
	mov lr, r4
	add ip, r1, #1
_02089AA4:
	ldrb r3, [ip], #1
	ldrb r0, [lr], #1
	cmp r0, r3
	bne _02089ABC
	cmp r0, #0
	bne _02089AA4
_02089ABC:
	cmp r3, #0
	subeq r0, r4, #1
	ldmeqia sp!, {r4, pc}
_02089AC8:
	ldrb r3, [r4], #1
	cmp r3, #0
	bne _02089A94
_02089AD4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end strstr

	arm_func_start sub_02089ADC
sub_02089ADC: ; 0x02089ADC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa8
	ldr r4, [sp, #0xd0]
	mov sl, #0
	str r4, [sp, #0xd0]
	str r0, [sp]
	add r6, sp, #0x80
	mov sb, r1
	mov r8, r2
	str r3, [sp, #4]
	mov r4, sl
	str sl, [sp, #0x2c]
	mov r5, #1
	mov r0, #4
_02089B14:
	strh sl, [r6]
	strh sl, [r6, #2]
	strh sl, [r6, #4]
	strh sl, [r6, #6]
	add r6, r6, #8
	subs r0, r0, #1
	bne _02089B14
	mov r0, #0
	str r0, [sp, #0x28]
	strh sl, [r6]
	strh sl, [r6, #2]
	ldr r2, [sp, #0x28]
	ldr r1, [sp, #0xd0]
	strh sl, [r6, #4]
	str r2, [r1]
	mov r1, r2
	mov r0, r8
	str r1, [sp, #0x24]
	str r1, [sp, #0x20]
	str r1, [sp, #0x1c]
	str r1, [sp, #0x18]
	str r1, [sp, #0x10]
	str r1, [sp, #0xc]
	str r1, [sp, #8]
	add r4, r4, #1
	blx sb
	mov r1, r0
	ldr r7, _0208AABC ; =_020AEEB5
	add r0, sp, #0x4d
	mov r6, #4
_02089B8C:
	ldrb r3, [r7]
	ldrb r2, [r7, #1]
	add r7, r7, #2
	strb r3, [r0]
	strb r2, [r0, #1]
	add r0, r0, #2
	subs r6, r6, #1
	bne _02089B8C
	ldrb r3, [r7]
	ldr r2, _0208AAC0 ; =_020AEEB0
	strb r3, [r0]
	ldrb r3, [r2, #1]
	ldrb r0, [r2, #2]
	ldrb r6, [r2]
	strb r3, [sp, #0x31]
	strb r0, [sp, #0x32]
	ldrb r3, [r2, #3]
	ldrb r0, [r2, #4]
	strb r6, [sp, #0x30]
	strb r3, [sp, #0x33]
	strb r0, [sp, #0x34]
	b _0208A8D0
_02089BE4:
	cmp r5, #0x100
	bgt _02089C5C
	bge _0208A364
	cmp r5, #0x20
	bgt _02089C40
	bge _0208A238
	cmp r5, #8
	bgt _02089C34
	cmp r5, #0
	addge pc, pc, r5, lsl #2
	b _0208A8D0
_02089C10: ; jump table
	b _0208A8D0 ; case 0
	b _02089CA0 ; case 1
	b _0208A084 ; case 2
	b _0208A8D0 ; case 3
	b _0208A134 ; case 4
	b _0208A8D0 ; case 5
	b _0208A8D0 ; case 6
	b _0208A8D0 ; case 7
	b _0208A15C ; case 8
_02089C34:
	cmp r5, #0x10
	beq _0208A200
	b _0208A8D0
_02089C40:
	cmp r5, #0x40
	bgt _02089C50
	beq _0208A2C4
	b _0208A8D0
_02089C50:
	cmp r5, #0x80
	beq _0208A310
	b _0208A8D0
_02089C5C:
	cmp r5, #0x2000
	bgt _02089C84
	bge _02089EB8
	cmp r5, #0x200
	bgt _02089C78
	beq _0208A3C4
	b _0208A8D0
_02089C78:
	cmp r5, #0x400
	beq _0208A3EC
	b _0208A8D0
_02089C84:
	cmp r5, #0x4000
	bgt _02089C94
	beq _02089DC0
	b _0208A8D0
_02089C94:
	cmp r5, #0x8000
	beq _0208A464
	b _0208A8D0
_02089CA0:
	cmp r1, #0
	blt _02089CB0
	cmp r1, #0x80
	blt _02089CB8
_02089CB0:
	mov r0, #0
	b _02089CC8
_02089CB8:
	mov r2, r1, lsl #1
	ldr r0, _0208AAC4 ; =_020AEDB0
	ldrh r0, [r0, r2]
	and r0, r0, #0x100
_02089CC8:
	cmp r0, #0
	beq _02089CF4
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r1, r0
	ldr r0, [sp, #0x2c]
	add r0, r0, #1
	str r0, [sp, #0x2c]
	b _0208A8D0
_02089CF4:
	cmp r1, #0
	blt _02089D04
	cmp r1, #0x80
	blt _02089D0C
_02089D04:
	mov r0, r1
	b _02089D14
_02089D0C:
	ldr r0, _0208AAC8 ; =_020AED30
	ldrb r0, [r0, r1]
_02089D14:
	cmp r0, #0x49
	bgt _02089D40
	bge _02089D78
	cmp r0, #0x2d
	bgt _02089DB8
	cmp r0, #0x2b
	blt _02089DB8
	beq _02089D54
	cmp r0, #0x2d
	beq _02089D4C
	b _02089DB8
_02089D40:
	cmp r0, #0x4e
	beq _02089D98
	b _02089DB8
_02089D4C:
	mov r0, #1
	str r0, [sp, #0x28]
_02089D54:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	mov r0, #1
	str r0, [sp, #0x18]
	b _0208A8D0
_02089D78:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	mov r5, #0x4000
	b _0208A8D0
_02089D98:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	mov r5, #0x2000
	b _0208A8D0
_02089DB8:
	mov r5, #2
	b _0208A8D0
_02089DC0:
	mov r5, #1
	add r7, sp, #0x4d
	add r0, sp, #0x76
	mov r6, #4
_02089DD0:
	ldrb r3, [r7]
	ldrb r2, [r7, #1]
	add r7, r7, #2
	strb r3, [r0]
	strb r2, [r0, #1]
	add r0, r0, #2
	subs r6, r6, #1
	bne _02089DD0
	ldrb r2, [r7]
	add r6, sp, #0x77
	ldr r7, _0208AAC8 ; =_020AED30
	strb r2, [r0]
	b _02089E24
_02089E04:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r6, r6, #1
	add r5, r5, #1
	add r4, r4, #1
	blx sb
	mov r1, r0
_02089E24:
	cmp r5, #8
	bge _02089E54
	cmp r1, #0
	blt _02089E3C
	cmp r1, #0x80
	blt _02089E44
_02089E3C:
	mov r2, r1
	b _02089E48
_02089E44:
	ldrb r2, [r7, r1]
_02089E48:
	ldrsb r0, [r6]
	cmp r0, r2
	beq _02089E04
_02089E54:
	cmp r5, #3
	cmpne r5, #8
	bne _02089EB0
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _02089E84
	ldr r1, _0208AACC ; =_020B2FB8
	mov r0, #0
	ldr r1, [r1]
	bl _fsub
	bl _f2d
	b _02089E90
_02089E84:
	ldr r0, _0208AACC ; =_020B2FB8
	ldr r0, [r0]
	bl _f2d
_02089E90:
	ldr r2, [sp, #0x2c]
	add r3, r2, r5
	ldr r2, [sp, #0x18]
	add r3, r2, r3
	ldr r2, [sp, #4]
	add sp, sp, #0xa8
	str r3, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02089EB0:
	mov r5, #0x1000
	b _0208A8D0
_02089EB8:
	ldrb r3, [sp, #0x30]
	ldrb r0, [sp, #0x32]
	ldrb r2, [sp, #0x31]
	strb r3, [sp, #0x40]
	strb r0, [sp, #0x42]
	ldrb r3, [sp, #0x33]
	ldrb r0, [sp, #0x34]
	strb r2, [sp, #0x41]
	mov r5, #1
	strb r0, [sp, #0x44]
	mov r6, #0
	add r2, sp, #0x56
	strb r3, [sp, #0x43]
	mov r0, #8
_02089EF0:
	strb r6, [r2]
	strb r6, [r2, #1]
	strb r6, [r2, #2]
	strb r6, [r2, #3]
	add r2, r2, #4
	subs r0, r0, #1
	bne _02089EF0
	add r7, sp, #0x41
	b _02089F34
_02089F14:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r7, r7, #1
	add r5, r5, #1
	add r4, r4, #1
	blx sb
	mov r1, r0
_02089F34:
	cmp r5, #4
	bge _02089F68
	cmp r1, #0
	blt _02089F4C
	cmp r1, #0x80
	blt _02089F54
_02089F4C:
	mov r2, r1
	b _02089F5C
_02089F54:
	ldr r0, _0208AAC8 ; =_020AED30
	ldrb r2, [r0, r1]
_02089F5C:
	ldrsb r0, [r7]
	cmp r0, r2
	beq _02089F14
_02089F68:
	sub r0, r5, #3
	cmp r0, #1
	bhi _0208A07C
	cmp r5, #4
	bne _0208A020
	ldr r7, _0208AAC4 ; =_020AEDB0
	b _02089FA8
_02089F84:
	add r0, sp, #0x56
	strb r1, [r0, r6]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r6, r6, #1
	add r4, r4, #1
	blx sb
	mov r1, r0
_02089FA8:
	cmp r6, #0x20
	bge _0208A010
	cmp r1, #0
	blt _02089FC0
	cmp r1, #0x80
	blt _02089FC8
_02089FC0:
	mov r0, #0
	b _02089FD4
_02089FC8:
	mov r0, r1, lsl #1
	ldrh r0, [r7, r0]
	and r0, r0, #8
_02089FD4:
	cmp r0, #0
	bne _02089F84
	cmp r1, #0
	blt _02089FEC
	cmp r1, #0x80
	blt _02089FF4
_02089FEC:
	mov r0, #0
	b _0208A000
_02089FF4:
	mov r0, r1, lsl #1
	ldrh r0, [r7, r0]
	and r0, r0, #1
_0208A000:
	cmp r0, #0
	bne _02089F84
	cmp r1, #0x2e
	beq _02089F84
_0208A010:
	cmp r1, #0x29
	movne r5, #0x1000
	bne _0208A8D0
	add r6, r6, #1
_0208A020:
	add r0, sp, #0x56
	mov r1, #0
	strb r1, [r0, r6]
	ldr r1, [sp, #0x28]
	cmp r1, #0
	beq _0208A054
	bl sub_02086450
	mov r2, r0
	mov r0, #0
	mov r3, r1
	mov r1, r0
	bl _dsub
	b _0208A058
_0208A054:
	bl sub_02086450
_0208A058:
	ldr r2, [sp, #0x2c]
	add r2, r2, r5
	add r3, r6, r2
	ldr r2, [sp, #0x18]
	add r3, r2, r3
	ldr r2, [sp, #4]
	add sp, sp, #0xa8
	str r3, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0208A07C:
	mov r5, #0x1000
	b _0208A8D0
_0208A084:
	cmp r1, #0x2e
	bne _0208A0AC
	mov r5, #0x10
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A0AC:
	cmp r1, #0
	blt _0208A0BC
	cmp r1, #0x80
	blt _0208A0C4
_0208A0BC:
	mov r0, #0
	b _0208A0D4
_0208A0C4:
	mov r2, r1, lsl #1
	ldr r0, _0208AAC4 ; =_020AEDB0
	ldrh r0, [r0, r2]
	and r0, r0, #8
_0208A0D4:
	cmp r0, #0
	moveq r5, #0x1000
	beq _0208A8D0
	cmp r1, #0x30
	bne _0208A12C
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	cmp r0, #0
	mov r1, r0
	blt _0208A118
	cmp r0, #0x80
	bge _0208A118
	ldr r2, _0208AAC8 ; =_020AED30
	ldrb r0, [r2, r0]
_0208A118:
	cmp r0, #0x58
	moveq r5, #0x8000
	moveq sl, #1
	movne r5, #4
	b _0208A8D0
_0208A12C:
	mov r5, #8
	b _0208A8D0
_0208A134:
	cmp r1, #0x30
	movne r5, #8
	bne _0208A8D0
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A15C:
	cmp r1, #0
	blt _0208A16C
	cmp r1, #0x80
	blt _0208A174
_0208A16C:
	mov r0, #0
	b _0208A184
_0208A174:
	mov r2, r1, lsl #1
	ldr r0, _0208AAC4 ; =_020AEDB0
	ldrh r0, [r0, r2]
	and r0, r0, #8
_0208A184:
	cmp r0, #0
	bne _0208A1B8
	cmp r1, #0x2e
	movne r5, #0x40
	bne _0208A8D0
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov r5, #0x20
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A1B8:
	ldrb r2, [sp, #0x84]
	cmp r2, #0x14
	ldrhs r0, [sp, #0x1c]
	addhs r0, r0, #1
	strhs r0, [sp, #0x1c]
	bhs _0208A1E4
	add r0, r2, #1
	strb r0, [sp, #0x84]
	add r0, sp, #0x80
	add r0, r0, r2
	strb r1, [r0, #5]
_0208A1E4:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A200:
	cmp r1, #0
	blt _0208A210
	cmp r1, #0x80
	blt _0208A218
_0208A210:
	mov r0, #0
	b _0208A228
_0208A218:
	mov r2, r1, lsl #1
	ldr r0, _0208AAC4 ; =_020AEDB0
	ldrh r0, [r0, r2]
	and r0, r0, #8
_0208A228:
	cmp r0, #0
	moveq r5, #0x1000
	movne r5, #0x20
	b _0208A8D0
_0208A238:
	cmp r1, #0
	blt _0208A248
	cmp r1, #0x80
	blt _0208A250
_0208A248:
	mov r0, #0
	b _0208A260
_0208A250:
	mov r2, r1, lsl #1
	ldr r0, _0208AAC4 ; =_020AEDB0
	ldrh r0, [r0, r2]
	and r0, r0, #8
_0208A260:
	cmp r0, #0
	moveq r5, #0x40
	beq _0208A8D0
	ldrb r3, [sp, #0x84]
	cmp r3, #0x14
	bhs _0208A2A8
	cmp r1, #0x30
	cmpeq r3, #0
	beq _0208A29C
	ldrb r2, [sp, #0x84]
	add r0, sp, #0x80
	add r0, r0, r3
	add r2, r2, #1
	strb r2, [sp, #0x84]
	strb r1, [r0, #5]
_0208A29C:
	ldr r0, [sp, #0x1c]
	sub r0, r0, #1
	str r0, [sp, #0x1c]
_0208A2A8:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A2C4:
	cmp r1, #0
	blt _0208A2D4
	cmp r1, #0x80
	blt _0208A2DC
_0208A2D4:
	mov r0, r1
	b _0208A2E4
_0208A2DC:
	ldr r0, _0208AAC8 ; =_020AED30
	ldrb r0, [r0, r1]
_0208A2E4:
	cmp r0, #0x45
	movne r5, #0x800
	bne _0208A8D0
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov r5, #0x80
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A310:
	cmp r1, #0x2b
	bne _0208A334
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _0208A35C
_0208A334:
	cmp r1, #0x2d
	bne _0208A35C
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	mov r0, #1
	str r0, [sp, #0x24]
_0208A35C:
	mov r5, #0x100
	b _0208A8D0
_0208A364:
	cmp r1, #0
	blt _0208A374
	cmp r1, #0x80
	blt _0208A37C
_0208A374:
	mov r0, #0
	b _0208A38C
_0208A37C:
	mov r2, r1, lsl #1
	ldr r0, _0208AAC4 ; =_020AEDB0
	ldrh r0, [r0, r2]
	and r0, r0, #8
_0208A38C:
	cmp r0, #0
	moveq r5, #0x1000
	beq _0208A8D0
	cmp r1, #0x30
	movne r5, #0x400
	bne _0208A8D0
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov r5, #0x200
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A3C4:
	cmp r1, #0x30
	movne r5, #0x400
	bne _0208A8D0
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A3EC:
	cmp r1, #0
	blt _0208A3FC
	cmp r1, #0x80
	blt _0208A404
_0208A3FC:
	mov r0, #0
	b _0208A414
_0208A404:
	mov r2, r1, lsl #1
	ldr r0, _0208AAC4 ; =_020AEDB0
	ldrh r0, [r0, r2]
	and r0, r0, #8
_0208A414:
	cmp r0, #0
	moveq r5, #0x800
	beq _0208A8D0
	ldr r0, [sp, #0x20]
	sub r2, r1, #0x30
	mov r1, #0xa
	mla r0, r1, r0, r2
	ldr r1, _0208AAD0 ; =0x00007FFF
	str r0, [sp, #0x20]
	cmp r0, r1
	ldrgt r0, [sp, #0xd0]
	movgt r1, #1
	strgt r1, [r0]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A464:
	cmp sl, #0x20
	bgt _0208A4B4
	bge _0208A788
	cmp sl, #8
	bgt _0208A4A8
	cmp sl, #0
	addge pc, pc, sl, lsl #2
	b _0208A8D0
_0208A484: ; jump table
	b _0208A8D0 ; case 0
	b _0208A4D8 ; case 1
	b _0208A528 ; case 2
	b _0208A8D0 ; case 3
	b _0208A550 ; case 4
	b _0208A8D0 ; case 5
	b _0208A8D0 ; case 6
	b _0208A8D0 ; case 7
	b _0208A660 ; case 8
_0208A4A8:
	cmp sl, #0x10
	beq _0208A73C
	b _0208A8D0
_0208A4B4:
	cmp sl, #0x80
	bgt _0208A4CC
	bge _0208A830
	cmp sl, #0x40
	beq _0208A7D0
	b _0208A8D0
_0208A4CC:
	cmp sl, #0x100
	beq _0208A858
	b _0208A8D0
_0208A4D8:
	mov r1, #0
	add r0, sp, #0x45
	str r0, [sp, #0x14]
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	mov r0, r8
	mov r2, r1
	str r1, [sp, #8]
	mov fp, r1
	mov sl, #2
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A528:
	cmp r1, #0x30
	movne sl, #4
	bne _0208A8D0
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A550:
	cmp r1, #0
	blt _0208A560
	cmp r1, #0x80
	blt _0208A568
_0208A560:
	mov r0, #0
	b _0208A578
_0208A568:
	mov r2, r1, lsl #1
	ldr r0, _0208AAC4 ; =_020AEDB0
	ldrh r0, [r0, r2]
	and r0, r0, #0x400
_0208A578:
	cmp r0, #0
	bne _0208A5AC
	cmp r1, #0x2e
	movne sl, #0x10
	bne _0208A8D0
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov sl, #8
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A5AC:
	ldr r2, [sp, #8]
	mov r0, #0xe
	cmp r2, r0
	bhs _0208A644
	mov r0, r2
	add r0, r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	add r2, fp, fp, lsr #31
	cmp r1, #0
	ldrb r0, [r0, r2, asr #1]
	blt _0208A5EC
	cmp r1, #0x80
	bge _0208A5EC
	ldr r2, _0208AAC8 ; =_020AED30
	ldrb r1, [r2, r1]
_0208A5EC:
	cmp r1, #0x41
	subge r1, r1, #0x37
	sublt r1, r1, #0x30
	mov r2, fp, lsr #0x1f
	and r3, r1, #0xff
	rsb r1, r2, fp, lsl #31
	adds r1, r2, r1, ror #31
	moveq r1, r3, lsl #4
	add r2, fp, fp, lsr #31
	orrne r0, r0, r3
	andeq r1, r1, #0xff
	orreq r0, r0, r1
	ldr r1, [sp, #0x14]
	add fp, fp, #1
	strb r0, [r1, r2, asr #1]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A644:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A660:
	cmp r1, #0
	blt _0208A670
	cmp r1, #0x80
	blt _0208A678
_0208A670:
	mov r0, #0
	b _0208A688
_0208A678:
	mov r2, r1, lsl #1
	ldr r0, _0208AAC4 ; =_020AEDB0
	ldrh r0, [r0, r2]
	and r0, r0, #0x400
_0208A688:
	cmp r0, #0
	moveq sl, #0x10
	beq _0208A8D0
	ldr r2, [sp, #8]
	mov r0, #0xe
	cmp r2, r0
	bhs _0208A720
	ldr r0, [sp, #0x14]
	add r2, fp, fp, lsr #31
	cmp r1, #0
	ldrb r0, [r0, r2, asr #1]
	blt _0208A6C8
	cmp r1, #0x80
	bge _0208A6C8
	ldr r2, _0208AAC8 ; =_020AED30
	ldrb r1, [r2, r1]
_0208A6C8:
	cmp r1, #0x41
	subge r1, r1, #0x37
	sublt r1, r1, #0x30
	mov r2, fp, lsr #0x1f
	and r3, r1, #0xff
	rsb r1, r2, fp, lsl #31
	adds r1, r2, r1, ror #31
	moveq r1, r3, lsl #4
	add r2, fp, fp, lsr #31
	orrne r0, r0, r3
	andeq r1, r1, #0xff
	orreq r0, r0, r1
	ldr r1, [sp, #0x14]
	add fp, fp, #1
	strb r0, [r1, r2, asr #1]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A720:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A73C:
	cmp r1, #0
	blt _0208A74C
	cmp r1, #0x80
	blt _0208A754
_0208A74C:
	mov r0, r1
	b _0208A75C
_0208A754:
	ldr r0, _0208AAC8 ; =_020AED30
	ldrb r0, [r0, r1]
_0208A75C:
	cmp r0, #0x50
	movne r5, #0x800
	bne _0208A8D0
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov sl, #0x20
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A788:
	cmp r1, #0x2d
	moveq r0, #1
	streq r0, [sp, #0xc]
	beq _0208A7B0
	cmp r1, #0x2b
	beq _0208A7B0
	mov r0, r8
	mov r2, #1
	blx sb
	sub r4, r4, #1
_0208A7B0:
	mov sl, #0x40
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A7D0:
	cmp r1, #0
	blt _0208A7E0
	cmp r1, #0x80
	blt _0208A7E8
_0208A7E0:
	mov r0, #0
	b _0208A7F8
_0208A7E8:
	mov r2, r1, lsl #1
	ldr r0, _0208AAC4 ; =_020AEDB0
	ldrh r0, [r0, r2]
	and r0, r0, #8
_0208A7F8:
	cmp r0, #0
	moveq r5, #0x1000
	beq _0208A8D0
	cmp r1, #0x30
	movne sl, #0x100
	bne _0208A8D0
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov sl, #0x80
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A830:
	cmp r1, #0x30
	movne sl, #0x100
	bne _0208A8D0
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _0208A8D0
_0208A858:
	cmp r1, #0
	blt _0208A868
	cmp r1, #0x80
	blt _0208A870
_0208A868:
	mov r0, #0
	b _0208A880
_0208A870:
	mov r2, r1, lsl #1
	ldr r0, _0208AAC4 ; =_020AEDB0
	ldrh r0, [r0, r2]
	and r0, r0, #8
_0208A880:
	cmp r0, #0
	moveq r5, #0x800
	beq _0208A8D0
	ldr r0, [sp, #0x10]
	sub r2, r1, #0x30
	mov r1, #0xa
	mla r0, r1, r0, r2
	str r0, [sp, #0x10]
	ldr r1, _0208AAD0 ; =0x00007FFF
	ldr r0, [sp, #0x20]
	add r4, r4, #1
	cmp r0, r1
	ldrgt r0, [sp, #0xd0]
	movgt r1, #1
	strgt r1, [r0]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r1, r0
_0208A8D0:
	ldr r0, [sp]
	cmp r4, r0
	bgt _0208A8F0
	mvn r0, #0
	cmp r1, r0
	beq _0208A8F0
	tst r5, #0x1800
	beq _02089BE4
_0208A8F0:
	cmp r5, #0x8000
	beq _0208A90C
	ldr r0, _0208AAD4 ; =0x00000E2C
	tst r5, r0
	moveq r0, #1
	movne r0, #0
	b _0208A930
_0208A90C:
	sub r0, r4, #1
	cmp r0, #2
	ble _0208A924
	ldr r0, _0208AAD8 ; =0x0000018E
	tst sl, r0
	bne _0208A92C
_0208A924:
	mov r0, #1
	b _0208A930
_0208A92C:
	mov r0, #0
_0208A930:
	cmp r0, #0
	movne r2, #0
	ldrne r0, [sp, #4]
	bne _0208A950
	ldr r0, [sp, #0x2c]
	sub r2, r4, #1
	add r2, r2, r0
	ldr r0, [sp, #4]
_0208A950:
	str r2, [r0]
	mov r0, r8
	mov r2, #1
	blx sb
	cmp sl, #0
	bne _0208AB54
	ldr r0, [sp, #0x24]
	ldrb r2, [sp, #0x84]
	cmp r0, #0
	ldrne r0, [sp, #0x20]
	rsbne r0, r0, #0
	strne r0, [sp, #0x20]
	add r0, sp, #0x85
	add r1, r0, r2
	b _0208A998
_0208A98C:
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
_0208A998:
	cmp r2, #0
	sub r2, r2, #1
	beq _0208A9B0
	ldrb r0, [r1, #-1]!
	cmp r0, #0x30
	beq _0208A98C
_0208A9B0:
	add r0, r2, #1
	strb r0, [sp, #0x84]
	ands r2, r0, #0xff
	bne _0208A9D4
	add r1, r2, #1
	strb r1, [sp, #0x84]
	add r0, sp, #0x85
	mov r1, #0x30
	strb r1, [r0, r2]
_0208A9D4:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	mov r2, #0x8000
	add r0, r1, r0
	rsb r2, r2, #0
	str r0, [sp, #0x20]
	cmp r0, r2
	blt _0208A9FC
	cmp r0, r2, lsr #17
	ble _0208AA08
_0208A9FC:
	ldr r0, [sp, #0xd0]
	mov r1, #1
	str r1, [r0]
_0208AA08:
	ldr r0, [sp, #0xd0]
	ldr r0, [r0]
	cmp r0, #0
	beq _0208AA64
	ldr r0, [sp, #0x24]
	cmp r0, #0
	movne r0, #0
	addne sp, sp, #0xa8
	movne r1, r0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #0x28]
	cmp r0, #0
	ldreq r1, _0208AADC ; =_020B2FC0
	addeq sp, sp, #0xa8
	ldmeqia r1, {r0, r1}
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, _0208AADC ; =_020B2FC0
	mov r0, #0
	ldmia r1, {r2, r3}
	mov r1, r0
	bl _dsub
	add sp, sp, #0xa8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0208AA64:
	ldr r1, [sp, #0x20]
	add r0, sp, #0x80
	strh r1, [sp, #0x82]
	bl sub_0208D6E0
	mov r4, r0
	mov r6, r1
	mov r0, #0
	mov r1, r0
	mov r2, r4
	mov r3, r6
	bl _dneq
	beq _0208AAE4
	mov r0, r4
	mov r1, r6
	mov r2, #0
	mov r3, #0x100000
	bl _dls
	bhs _0208AAE4
	ldr r0, [sp, #0xd0]
	mov r1, #1
	str r1, [r0]
	b _0208AB10
	.align 2, 0
_0208AABC: .word _020AEEB5
_0208AAC0: .word _020AEEB0
_0208AAC4: .word _020AEDB0
_0208AAC8: .word _020AED30
_0208AACC: .word _020B2FB8
_0208AAD0: .word 0x00007FFF
_0208AAD4: .word 0x00000E2C
_0208AAD8: .word 0x0000018E
_0208AADC: .word _020B2FC0
_0208AAE0: .word 0x7FEFFFFF
_0208AAE4:
	ldr r3, _0208AAE0 ; =0x7FEFFFFF
	mov r0, r4
	mov r1, r6
	mvn r2, #0
	bl _dgr
	bls _0208AB10
	ldr r0, [sp, #0xd0]
	mov r2, #1
	ldr r1, _0208AADC ; =_020B2FC0
	str r2, [r0]
	ldmia r1, {r4, r6}
_0208AB10:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0208AB44
	ldr r0, _0208AAD4 ; =0x00000E2C
	tst r5, r0
	beq _0208AB44
	mov r0, #0
	mov r1, r0
	mov r2, r4
	mov r3, r6
	bl _dsub
	mov r4, r0
	mov r6, r1
_0208AB44:
	add sp, sp, #0xa8
	mov r0, r4
	mov r1, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0208AB54:
	ldr r0, [sp, #0xc]
	add r4, sp, #0x38
	cmp r0, #0
	ldrne r0, [sp, #0x10]
	ldrb r3, [sp, #0x45]
	rsbne r0, r0, #0
	strne r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #8]
	mov r2, #0
	add r0, r1, r0, lsl #2
	str r0, [sp, #0x10]
	mov r1, #0x80
	b _0208AB9C
_0208AB8C:
	ldr r0, [sp, #0x10]
	add r2, r2, #1
	sub r0, r0, #1
	str r0, [sp, #0x10]
_0208AB9C:
	cmp r2, #4
	bhs _0208ABAC
	tst r3, r1, asr r2
	beq _0208AB8C
_0208ABAC:
	adds r5, r2, #1
	beq _0208ABF8
	add r0, sp, #0x4c
	add r3, sp, #0x45
	str r0, [sp, #0x14]
	mov r1, #0
	cmp r0, r3
	blo _0208ABF8
	rsb r6, r5, #8
_0208ABD0:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	orr r2, r1, r0, lsl r5
	mov r1, r0, asr r6
	ldr r0, [sp, #0x14]
	and r1, r1, #0xff
	strb r2, [r0], #-1
	str r0, [sp, #0x14]
	cmp r0, r3
	bhs _0208ABD0
_0208ABF8:
	mov r2, #0
	mov r6, r2
	strb r2, [r4]
	strb r2, [r4, #1]
	strb r2, [r4, #2]
	strb r2, [r4, #3]
	strb r2, [r4, #4]
	strb r2, [r4, #5]
	strb r2, [r4, #6]
	strb r2, [r4, #7]
	mov r3, #0xc
	mov r7, #1
	mov r0, #0xff
	add r1, sp, #0x45
_0208AC30:
	add r5, r2, #8
	cmp r5, #0x34
	ldrb r5, [r1, r6]
	rsbhi r8, r2, #0x34
	and fp, r3, #7
	andhi r5, r5, r0, lsl r8
	andhi r5, r5, #0xff
	mov r8, r5, asr fp
	and sb, r8, #0xff
	ldrb sl, [r4, r7]
	rsb r8, fp, #8
	mov r5, r5, lsl r8
	orr sb, sl, sb
	strb sb, [r4, r7]
	add r7, r7, #1
	add r2, r2, #8
	ldrb r8, [r4, r7]
	and r5, r5, #0xff
	cmp r2, #0x34
	orr r5, r8, r5
	strb r5, [r4, r7]
	add r3, r3, #8
	add r6, r6, #1
	blo _0208AC30
	ldr r0, [sp, #0x10]
	mov r1, #0x800
	add r0, r0, #0xfe
	add r2, r0, #0x300
	rsb r1, r1, #0
	tst r2, r1
	beq _0208ACC8
	ldr r2, [sp, #0xd0]
	mov r3, #1
	mov r0, #0
	add sp, sp, #0xa8
	mov r1, r0
	str r3, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0208ACC8:
	ldrb r0, [r4, #1]
	mov r2, r2, lsl #0x15
	ldrb r1, [r4]
	orr r0, r0, r2, lsr #17
	strb r0, [r4, #1]
	ldr r0, [sp, #0x28]
	orr r1, r1, r2, lsr #25
	cmp r0, #0
	andne r0, r1, #0xff
	strb r1, [r4]
	orrne r0, r0, #0x80
	strneb r0, [r4]
	mov r3, #0
_0208ACFC:
	rsb r1, r3, #7
	ldrb r2, [r4, r3]
	ldrb r0, [r4, r1]
	strb r0, [r4, r3]
	add r3, r3, #1
	strb r2, [r4, r1]
	cmp r3, #4
	blt _0208ACFC
	ldmia r4, {r0, r1}
	add sp, sp, #0xa8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_02089ADC

	arm_func_start sub_0208AD28
sub_0208AD28: ; 0x0208AD28
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r0, #0
	mov r6, r1
	str r0, [sp, #8]
	add r4, sp, #0xc
	str r7, [sp, #4]
	ldr r1, _0208ADFC ; =sub_020895F4
	add r2, sp, #4
	add r3, sp, #0x10
	sub r0, r0, #0x80000001
	str r4, [sp]
	bl sub_02089ADC
	mov r5, r1
	mov r4, r0
	cmp r6, #0
	ldrne r0, [sp, #0x10]
	mov r1, r5
	addne r0, r7, r0
	strne r0, [r6]
	mov r0, r4
	bl sub_0208C5B4
	ldr r2, [sp, #0xc]
	mov r6, r0
	mov r7, r1
	cmp r2, #0
	bne _0208ADE0
	mov r0, #0
	mov r1, r0
	mov r2, r4
	mov r3, r5
	bl _dneq
	beq _0208ADEC
	mov r0, r6
	mov r1, r7
	mov r2, #0
	mov r3, #0x100000
	bl _dls
	blo _0208ADE0
	ldr r3, _0208AE00 ; =0x7FEFFFFF
	mov r0, r6
	mov r1, r7
	mvn r2, #0
	bl _dgr
	bls _0208ADEC
_0208ADE0:
	ldr r0, _0208AE04 ; =_022BCA70
	mov r1, #0x22
	str r1, [r0]
_0208ADEC:
	mov r0, r4
	mov r1, r5
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0208ADFC: .word sub_020895F4
_0208AE00: .word 0x7FEFFFFF
_0208AE04: .word _022BCA70
	arm_func_end sub_0208AD28

	arm_func_start sub_0208AE08
sub_0208AE08: ; 0x0208AE08
	ldr ip, _0208AE14 ; =sub_0208AD28
	mov r1, #0
	bx ip
	.align 2, 0
_0208AE14: .word sub_0208AD28
	arm_func_end sub_0208AE08

	arm_func_start sub_0208AE18
sub_0208AE18: ; 0x0208AE18
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, [sp, #0x38]
	movs sb, r0
	ldr r0, [sp, #0x34]
	str r4, [sp, #0x38]
	mov r4, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x38]
	str r1, [sp]
	str r4, [r0]
	mov r0, r4
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	mov r1, r4
	str r1, [r0]
	ldr r0, [sp, #0x30]
	str r4, [sp, #8]
	mov r8, r2
	mov r7, r3
	mov r5, r4
	mov sl, r4
	str r0, [sp, #0x30]
	mov r4, #1
	bmi _0208AE98
	cmp sb, #1
	beq _0208AE98
	cmp sb, #0x24
	bgt _0208AE98
	ldr r0, [sp]
	cmp r0, #1
	bge _0208AEA0
_0208AE98:
	mov r4, #0x40
	b _0208AEBC
_0208AEA0:
	ldr r1, [sp, #8]
	mov r0, r7
	mov r3, r1
	mov r2, r1
	add r5, r3, #1
	blx r8
	mov r6, r0
_0208AEBC:
	cmp sb, #0
	beq _0208AED4
	mov r1, sb
	mvn r0, #0
	bl _u32_div_f
	str r0, [sp, #4]
_0208AED4:
	mvn fp, #0
	b _0208B194
_0208AEDC:
	cmp r4, #8
	bgt _0208AF14
	cmp r4, #0
	addge pc, pc, r4, lsl #2
	b _0208B194
_0208AEF0: ; jump table
	b _0208B194 ; case 0
	b sub_0208AF20 ; case 1
	b sub_0208AFCC ; case 2
	b _0208B194 ; case 3
	b sub_0208B008 ; case 4
	b _0208B194 ; case 5
	b _0208B194 ; case 6
	b _0208B194 ; case 7
	b _0208B048 ; case 8
_0208AF14:
	cmp r4, #0x10
	beq _0208B048
	b _0208B194
	arm_func_end sub_0208AE18

	arm_func_start sub_0208AF20
sub_0208AF20: ; 0x0208AF20
	cmp r6, #0
	blt _0208AF30
	cmp r6, #0x80
	blt _0208AF38
_0208AF30:
	mov r0, #0
	b _0208AF48
_0208AF38:
	ldr r0, _0208B1F8 ; =_020AEDB0
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x100
_0208AF48:
	cmp r0, #0
	beq _0208AF74
	mov r1, #0
	mov r0, r7
	mov r2, r1
	blx r8
	mov r6, r0
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	b _0208B194
_0208AF74:
	cmp r6, #0x2b
	bne _0208AF98
	mov r1, #0
	mov r0, r7
	mov r2, r1
	add r5, r5, #1
	blx r8
	mov r6, r0
	b _0208AFC4
_0208AF98:
	cmp r6, #0x2d
	bne _0208AFC4
	mov r1, #0
	mov r0, r7
	mov r2, r1
	add r5, r5, #1
	blx r8
	mov r6, r0
	ldr r0, [sp, #0x34]
	mov r1, #1
	str r1, [r0]
_0208AFC4:
	mov r4, #2
	b _0208B194
	arm_func_end sub_0208AF20

	arm_func_start sub_0208AFCC
sub_0208AFCC: ; 0x0208AFCC
	cmp sb, #0
	cmpne sb, #0x10
	bne _0208B000
	cmp r6, #0x30
	bne _0208B000
	mov r1, #0
	mov r0, r7
	mov r2, r1
	mov r4, #4
	add r5, r5, #1
	blx r8
	mov r6, r0
	b _0208B194
_0208B000:
	mov r4, #8
	b _0208B194
	arm_func_end sub_0208AFCC

	arm_func_start sub_0208B008
sub_0208B008: ; 0x0208B008
	cmp r6, #0x58
	cmpne r6, #0x78
	bne _0208B038
	mov r1, #0
	mov r0, r7
	mov r2, r1
	mov sb, #0x10
	mov r4, #8
	add r5, r5, #1
	blx r8
	mov r6, r0
	b _0208B194
_0208B038:
	cmp sb, #0
	moveq sb, #8
	mov r4, #0x10
	b _0208B194
_0208B048:
	ldr r0, [sp, #4]
	cmp sb, #0
	moveq sb, #0xa
	cmp r0, #0
	bne _0208B06C
	mov r0, fp
	mov r1, sb
	bl _u32_div_f
	str r0, [sp, #4]
_0208B06C:
	cmp r6, #0
	blt _0208B07C
	cmp r6, #0x80
	blt _0208B084
_0208B07C:
	mov r0, #0
	b _0208B094
_0208B084:
	ldr r0, _0208B1F8 ; =_020AEDB0
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #8
_0208B094:
	cmp r0, #0
	beq _0208B0BC
	sub r6, r6, #0x30
	cmp r6, sb
	blt _0208B144
	cmp r4, #0x10
	moveq r4, #0x20
	movne r4, #0x40
	add r6, r6, #0x30
	b _0208B194
_0208B0BC:
	cmp r6, #0
	blt _0208B0CC
	cmp r6, #0x80
	blt _0208B0D4
_0208B0CC:
	mov r0, #0
	b _0208B0E4
_0208B0D4:
	ldr r0, _0208B1F8 ; =_020AEDB0
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #1
_0208B0E4:
	cmp r0, #0
	beq _0208B118
	cmp r6, #0
	blt _0208B0FC
	cmp r6, #0x80
	blt _0208B104
_0208B0FC:
	mov r0, r6
	b _0208B10C
_0208B104:
	ldr r0, _0208B1FC ; =_020AED30
	ldrb r0, [r0, r6]
_0208B10C:
	sub r0, r0, #0x37
	cmp r0, sb
	blt _0208B128
_0208B118:
	cmp r4, #0x10
	moveq r4, #0x20
	movne r4, #0x40
	b _0208B194
_0208B128:
	cmp r6, #0
	blt _0208B140
	cmp r6, #0x80
	bge _0208B140
	ldr r0, _0208B1FC ; =_020AED30
	ldrb r6, [r0, r6]
_0208B140:
	sub r6, r6, #0x37
_0208B144:
	ldr r0, [sp, #4]
	mov r4, #0x10
	cmp sl, r0
	ldrhi r0, [sp, #0x38]
	movhi r1, #1
	strhi r1, [r0]
	mul r0, sl, sb
	mov sl, r0
	sub r0, fp, r0
	cmp r6, r0
	ldrhi r0, [sp, #0x38]
	movhi r1, #1
	strhi r1, [r0]
	mov r1, #0
	mov r0, r7
	mov r2, r1
	add sl, sl, r6
	add r5, r5, #1
	blx r8
	mov r6, r0
_0208B194:
	ldr r0, [sp]
	cmp r5, r0
	bgt _0208B1B0
	cmp r6, fp
	beq _0208B1B0
	tst r4, #0x60
	beq _0208AEDC
_0208B1B0:
	tst r4, #0x34
	bne _0208B1C8
	ldr r0, [sp, #0x30]
	mov sl, #0
	str sl, [r0]
	b _0208B1DC
_0208B1C8:
	ldr r0, [sp, #8]
	sub r1, r5, #1
	add r1, r1, r0
	ldr r0, [sp, #0x30]
	str r1, [r0]
_0208B1DC:
	mov r0, r7
	mov r1, r6
	mov r2, #1
	blx r8
	mov r0, sl
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0208B1F8: .word _020AEDB0
_0208B1FC: .word _020AED30
	arm_func_end sub_0208B008

	arm_func_start sub_0208B200
sub_0208B200: ; 0x0208B200
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	mov r5, r0
	mov lr, #0
	mov r0, r2
	mov r4, r1
	add r2, sp, #0x1c
	str r5, [sp, #0xc]
	str lr, [sp, #0x10]
	str r2, [sp]
	add r1, sp, #0x18
	str r1, [sp, #4]
	add ip, sp, #0x14
	ldr r2, _0208B290 ; =sub_020895F4
	add r3, sp, #0xc
	sub r1, lr, #0x80000001
	str ip, [sp, #8]
	bl sub_0208AE18
	cmp r4, #0
	ldrne r1, [sp, #0x1c]
	addne r1, r5, r1
	strne r1, [r4]
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _0208B27C
	ldr r0, _0208B294 ; =_022BCA70
	mov r1, #0x22
	str r1, [r0]
	add sp, sp, #0x20
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0208B27C:
	ldr r1, [sp, #0x18]
	cmp r1, #0
	rsbne r0, r0, #0
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0208B290: .word sub_020895F4
_0208B294: .word _022BCA70
	arm_func_end sub_0208B200

	arm_func_start sub_0208B298
sub_0208B298: ; 0x0208B298
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	mov r5, r0
	mov lr, #0
	mov r0, r2
	mov r4, r1
	add r2, sp, #0x1c
	str r5, [sp, #0xc]
	str lr, [sp, #0x10]
	str r2, [sp]
	add r1, sp, #0x18
	str r1, [sp, #4]
	add ip, sp, #0x14
	ldr r2, _0208B358 ; =sub_020895F4
	add r3, sp, #0xc
	sub r1, lr, #0x80000001
	str ip, [sp, #8]
	bl sub_0208AE18
	cmp r4, #0
	ldrne r1, [sp, #0x1c]
	addne r1, r5, r1
	strne r1, [r4]
	ldr r1, [sp, #0x14]
	cmp r1, #0
	bne _0208B324
	ldr r2, [sp, #0x18]
	cmp r2, #0
	bne _0208B314
	mvn r1, #0x80000000
	cmp r0, r1
	bhi _0208B324
_0208B314:
	cmp r2, #0
	beq _0208B348
	cmp r0, #0x80000000
	bls _0208B348
_0208B324:
	ldr r0, [sp, #0x18]
	ldr r1, _0208B35C ; =_022BCA70
	mov r2, #0x22
	cmp r0, #0
	movne r0, #0x80000000
	str r2, [r1]
	add sp, sp, #0x20
	mvneq r0, #0x80000000
	ldmia sp!, {r3, r4, r5, pc}
_0208B348:
	cmp r2, #0
	rsbne r0, r0, #0
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0208B358: .word sub_020895F4
_0208B35C: .word _022BCA70
	arm_func_end sub_0208B298

	arm_func_start sub_0208B360
sub_0208B360: ; 0x0208B360
	ldr ip, _0208B370 ; =sub_0208B298
	mov r1, #0
	mov r2, #0xa
	bx ip
	.align 2, 0
_0208B370: .word sub_0208B298
	arm_func_end sub_0208B360

	arm_func_start sub_0208B374
sub_0208B374: ; 0x0208B374
	cmp r0, #0
	beq _0208B38C
	ldr r3, [r0, #4]
	mov r2, r3, lsl #0x16
	movs r2, r2, lsr #0x1d
	bne _0208B394
_0208B38C:
	mov r0, #0
	bx lr
_0208B394:
	mov r2, r3, lsl #0x14
	movs r2, r2, lsr #0x1e
	beq _0208B3B4
	cmp r2, #1
	beq _0208B3DC
	cmp r2, #2
	moveq r1, #1
	b _0208B3E0
_0208B3B4:
	cmp r1, #0
	ble _0208B3CC
	bic r2, r3, #0xc00
	orr r2, r2, #0x800
	str r2, [r0, #4]
	b _0208B3E0
_0208B3CC:
	biclt r2, r3, #0xc00
	orrlt r2, r2, #0x400
	strlt r2, [r0, #4]
	b _0208B3E0
_0208B3DC:
	mvn r1, #0
_0208B3E0:
	mov r0, r1
	bx lr
	arm_func_end sub_0208B374

	arm_func_start wcslen
wcslen: ; 0x0208B3E8
	mvn r2, #0
_0208B3EC:
	ldrh r1, [r0], #2
	add r2, r2, #1
	cmp r1, #0
	bne _0208B3EC
	mov r0, r2
	bx lr
	arm_func_end wcslen

	arm_func_start sub_0208B404
sub_0208B404: ; 0x0208B404
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x80
	ldr r8, [sp, #0xb4]
	ldr r6, [sp, #0xac]
	ldr r0, [sp, #0xb0]
	bic sb, r8, #0x80000000
	orrs r1, sb, r0
	ldr r7, [sp, #0xa8]
	bic r4, r6, #0x80000000
	addeq sp, sp, #0x80
	moveq r0, #0
	ldreq r1, _0208B9B0 ; =0x3FF00000
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r1, _0208B9B4 ; =0x7FF00000
	cmp r4, r1
	bgt _0208B474
	bne _0208B45C
	cmp r7, #0
	bne _0208B474
_0208B45C:
	ldr r1, _0208B9B4 ; =0x7FF00000
	cmp sb, r1
	bgt _0208B474
	bne _0208B498
	cmp r0, #0
	beq _0208B498
_0208B474:
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	ldr r2, [sp, #0xb0]
	ldr r3, [sp, #0xb4]
	bl _dadd
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B498:
	cmp r6, #0
	mov r5, #0
	bge _0208B500
	ldr r1, _0208B9B8 ; =0x43400000
	cmp sb, r1
	movge r5, #2
	bge _0208B500
	sub r1, r1, #0x3500000
	cmp sb, r1
	blt _0208B500
	ldr r1, _0208B9BC ; =0xFFFFFC01
	add r1, r1, sb, asr #20
	cmp r1, #0x14
	ble _0208B4E8
	rsb r2, r1, #0x34
	mov r1, r0, lsr r2
	cmp r0, r1, lsl r2
	andeq r1, r1, #1
	rsbeq r5, r1, #2
	b _0208B500
_0208B4E8:
	cmp r0, #0
	rsbeq r2, r1, #0x14
	moveq r1, sb, asr r2
	cmpeq sb, r1, lsl r2
	andeq r1, r1, #1
	rsbeq r5, r1, #2
_0208B500:
	cmp r0, #0
	bne _0208B65C
	ldr r1, _0208B9B4 ; =0x7FF00000
	cmp sb, r1
	bne _0208B5B4
	add r0, r4, #0x100000
	add r0, r0, #0xc0000000
	orrs r0, r0, r7
	bne _0208B548
	ldr r0, [sp, #0xb0]
	ldr r1, [sp, #0xb4]
	mov r2, r0
	mov r3, r1
	bl _dsub
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B548:
	sub r0, r1, #0x40000000
	cmp r4, r0
	blt _0208B578
	cmp r8, #0
	ldrge r0, [sp, #0xb0]
	ldrge r1, [sp, #0xb4]
	movlt r0, #0
	add sp, sp, #0x80
	movlt r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B578:
	cmp r8, #0
	mov r0, #0
	addge sp, sp, #0x80
	movge r1, r0
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addge sp, sp, #0x10
	bxge lr
	ldr r2, [sp, #0xb0]
	ldr r3, [sp, #0xb4]
	mov r1, r0
	bl _dsub
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B5B4:
	sub r0, r1, #0x40000000
	cmp sb, r0
	bne _0208B600
	cmp r8, #0
	ldrge r0, [sp, #0xa8]
	ldrge r1, [sp, #0xac]
	addge sp, sp, #0x80
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addge sp, sp, #0x10
	bxge lr
	ldr r2, [sp, #0xa8]
	ldr r3, [sp, #0xac]
	sub r1, r1, #0x40000000
	mov r0, #0
	bl _ddiv
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B600:
	cmp r8, #0x40000000
	bne _0208B62C
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	mov r2, r0
	mov r3, r1
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B62C:
	ldr r0, _0208B9C0 ; =0x3FE00000
	cmp r8, r0
	bne _0208B65C
	cmp r6, #0
	blt _0208B65C
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	bl _dsqrt
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B65C:
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	bl sub_0208C5B4
	str r0, [sp, #0x70]
	str r1, [sp, #0x74]
	cmp r7, #0
	bne _0208B760
	ldr r0, _0208B9B4 ; =0x7FF00000
	cmp r4, r0
	cmpne r4, #0
	subne r0, r0, #0x40000000
	cmpne r4, r0
	bne _0208B760
	ldr r2, [sp, #0x70]
	ldr r3, [sp, #0x74]
	str r2, [sp, #0x78]
	str r3, [sp, #0x7c]
	cmp r8, #0
	bge _0208B6BC
	ldr r1, _0208B9B0 ; =0x3FF00000
	mov r0, #0
	bl _ddiv
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
_0208B6BC:
	cmp r6, #0
	bge _0208B748
	add r0, r4, #0x100000
	add r0, r0, #0xc0000000
	orrs r0, r0, r5
	bne _0208B724
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r0
	mov r3, r1
	bl _dsub
	mov r4, r0
	mov r5, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r0
	mov r3, r1
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, r5
	bl _ddiv
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
	b _0208B748
_0208B724:
	cmp r5, #1
	bne _0208B748
	mov r0, #0
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	mov r1, r0
	bl _dsub
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
_0208B748:
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B760:
	mov r0, r6, asr #0x1f
	add r7, r0, #1
	orrs r0, r7, r5
	bne _0208B798
	ldr r0, _0208B9C4 ; =_020B2FBC
	ldr r1, _0208B9C8 ; =_022BCA70
	ldr r0, [r0]
	mov r2, #0x21
	str r2, [r1]
	bl _f2d
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B798:
	ldr r3, _0208B9CC ; =0x41E00000
	cmp sb, r3
	ble _0208BA9C
	add r0, r3, #0x2100000
	cmp sb, r0
	ble _0208B808
	ldr r1, _0208B9D0 ; =0x3FEFFFFF
	cmp r4, r1
	bgt _0208B7DC
	cmp r8, #0
	mov r0, #0
	addlt r1, r1, #0x40000001
	add sp, sp, #0x80
	movge r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B7DC:
	add r0, r1, #1
	cmp r4, r0
	blt _0208B808
	cmp r8, #0
	mov r0, #0
	addgt r1, r1, #0x40000001
	add sp, sp, #0x80
	movle r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B808:
	ldr r2, _0208B9D0 ; =0x3FEFFFFF
	cmp r4, r2
	bge _0208B834
	cmp r8, #0
	mov r0, #0
	addlt r1, r2, #0x40000001
	add sp, sp, #0x80
	movge r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B834:
	add r0, r2, #1
	cmp r4, r0
	ble _0208B860
	cmp r8, #0
	mov r0, #0
	addgt r1, r2, #0x40000001
	add sp, sp, #0x80
	movle r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208B860:
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	add r3, r2, #1
	mov r2, #0
	bl _dsub
	mov r2, r0
	mov r3, r1
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	bl _dmul
	mov r6, r1
	mov r4, r0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	ldr r1, _0208B9D4 ; =0x3FD00000
	mov r0, #0
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208B9D8 ; =0x55555555
	sub r1, r0, #0x15800000
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, #0
	ldr r1, _0208B9C0 ; =0x3FE00000
	bl _dsub
	mov r2, r0
	mov r0, r4
	mov r3, r1
	mov r1, r6
	bl _dmul
	mov r6, r0
	mov r8, r1
	mov r0, #0x60000000
	ldr r1, _0208B9DC ; =0x3FF71547
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dmul
	mov r4, r0
	mov sb, r1
	ldr r0, _0208B9E0 ; =0xF85DDF44
	ldr r1, _0208B9E4 ; =0x3E54AE0B
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dmul
	mov fp, r0
	mov sl, r1
	ldr r0, _0208B9E8 ; =0x652B82FE
	ldr r1, _0208B9DC ; =0x3FF71547
	mov r2, r6
	mov r3, r8
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, fp
	mov r1, sl
	bl _dsub
	mov r6, r0
	mov r8, r1
	mov r0, r4
	mov r1, sb
	mov r2, r6
	mov r3, r8
	bl _dadd
	mov r2, r4
	mov r3, sb
	str r1, [sp, #0x5c]
	mov r0, #0
	str r0, [sp, #0x58]
	bl _dsub
	mov r2, r0
	mov r0, r6
	mov r3, r1
	mov r1, r8
	bl _dsub
	mov r4, r0
	mov r8, r1
	b _0208BFF8
	.align 2, 0
_0208B9B0: .word 0x3FF00000
_0208B9B4: .word 0x7FF00000
_0208B9B8: .word 0x43400000
_0208B9BC: .word 0xFFFFFC01
_0208B9C0: .word 0x3FE00000
_0208B9C4: .word _020B2FBC
_0208B9C8: .word _022BCA70
_0208B9CC: .word 0x41E00000
_0208B9D0: .word 0x3FEFFFFF
_0208B9D4: .word 0x3FD00000
_0208B9D8: .word 0x55555555
_0208B9DC: .word 0x3FF71547
_0208B9E0: .word 0xF85DDF44
_0208B9E4: .word 0x3E54AE0B
_0208B9E8: .word 0x652B82FE
_0208B9EC: .word 0x0003988E
_0208B9F0: .word 0x000BB67A
_0208B9F4: .word _020AEED0
_0208B9F8: .word 0x4A454EEF
_0208B9FC: .word 0x3FCA7E28
_0208BA00: .word 0x93C9DB65
_0208BA04: .word 0x3FCD864A
_0208BA08: .word 0xA91D4101
_0208BA0C: .word 0x3FD17460
_0208BA10: .word 0x518F264D
_0208BA14: .word 0x3FD55555
_0208BA18: .word 0xDB6FABFF
_0208BA1C: .word 0x3FDB6DB6
_0208BA20: .word 0x33333303
_0208BA24: .word 0x3FE33333
_0208BA28: .word 0x40080000
_0208BA2C: .word 0x3FEEC709
_0208BA30: .word 0x145B01F5
_0208BA34: .word 0xBE3E2FE0
_0208BA38: .word 0xDC3A03FD
_0208BA3C: .word _020AEEE0
_0208BA40: .word _020AEEC0
_0208BA44: .word 0x40900000
_0208BA48: .word 0x8800759C
_0208BA4C: .word 0x7E37E43C
_0208BA50: .word 0x3C971547
_0208BA54: .word 0x3F6F3400
_0208BA58: .word 0xC2F8F359
_0208BA5C: .word 0x01A56E1F
_0208BA60: .word 0x3FE62E43
_0208BA64: .word 0xFEFA39EF
_0208BA68: .word 0x3FE62E42
_0208BA6C: .word 0x0CA86C39
_0208BA70: .word 0xBE205C61
_0208BA74: .word 0x72BEA4D0
_0208BA78: .word 0x3E663769
_0208BA7C: .word 0xC5D26BF1
_0208BA80: .word 0xBEBBBD41
_0208BA84: .word 0xAF25DE2C
_0208BA88: .word 0x3F11566A
_0208BA8C: .word 0x16BEBD93
_0208BA90: .word 0xBF66C16C
_0208BA94: .word 0x5555553E
_0208BA98: .word 0x3FC55555
_0208BA9C:
	cmp r4, #0x100000
	mov r6, #0
	bge _0208BACC
	ldr r0, [sp, #0x70]
	ldr r1, [sp, #0x74]
	mov r2, r6
	add r3, r3, #0x1600000
	bl _dmul
	mov r4, r1
	str r0, [sp, #0x70]
	str r4, [sp, #0x74]
	sub r6, r6, #0x35
_0208BACC:
	ldr r0, _0208B9BC ; =0xFFFFFC01
	ldr r1, _0208B9EC ; =0x0003988E
	and r2, r4, r0, lsr #12
	add r0, r0, r4, asr #20
	orr sb, r2, #0xff00000
	cmp r2, r1
	add r6, r6, r0
	orr sb, sb, #0x30000000
	movle r8, #0
	ble _0208BB0C
	ldr r0, _0208B9F0 ; =0x000BB67A
	cmp r2, r0
	movlt r8, #1
	addge r6, r6, #1
	subge sb, sb, #0x100000
	movge r8, #0
_0208BB0C:
	ldr r2, _0208B9F4 ; =_020AEED0
	ldr r0, [sp, #0x70]
	add r1, r2, r8, lsl #3
	ldr r3, [r1, #4]
	ldr r2, [r2, r8, lsl #3]
	mov r1, sb
	str sb, [sp, #0x74]
	bl _dsub
	ldr r2, _0208B9F4 ; =_020AEED0
	mov sl, r0
	add r3, r2, r8, lsl #3
	mov r4, r1
	ldr r0, [sp, #0x70]
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	mov r1, sb
	bl _dadd
	mov r3, r1
	mov r2, r0
	ldr r1, _0208B9B0 ; =0x3FF00000
	mov r0, #0
	bl _ddiv
	str r1, [sp, #0x24]
	mov fp, r0
	ldr r3, [sp, #0x24]
	mov r0, sl
	mov r1, r4
	mov r2, fp
	bl _dmul
	mov r2, sb, asr #1
	orr r2, r2, #0x20000000
	mov sb, r1
	add r2, r2, #0x80000
	add r1, r2, r8, lsl #18
	ldr r2, _0208B9F4 ; =_020AEED0
	str r0, [sp, #0x28]
	add r3, r2, r8, lsl #3
	mov r0, #0
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	str sb, [sp, #0x4c]
	str r1, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [sp, #0x40]
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x70]
	ldr r1, [sp, #0x74]
	bl _dsub
	str r0, [sp, #0x2c]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	mov r1, sb
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, sl
	mov r1, r4
	bl _dsub
	mov sl, r0
	mov r4, r1
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x48]
	mov r1, sb
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, sl
	mov r1, r4
	bl _dsub
	mov r3, r1
	mov r2, r0
	ldr r1, [sp, #0x24]
	mov r0, fp
	bl _dmul
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x28]
	str r1, [sp, #0x14]
	mov r1, sb
	mov r2, r0
	mov r3, sb
	bl _dmul
	mov r4, r0
	mov sl, r1
	mov r2, r4
	mov r3, sl
	bl _dmul
	str r0, [sp, #0x34]
	mov fp, r1
	ldr r0, _0208B9F8 ; =0x4A454EEF
	ldr r1, _0208B9FC ; =0x3FCA7E28
	mov r2, r4
	mov r3, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA00 ; =0x93C9DB65
	ldr r1, _0208BA04 ; =0x3FCD864A
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA08 ; =0xA91D4101
	ldr r1, _0208BA0C ; =0x3FD17460
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA10 ; =0x518F264D
	ldr r1, _0208BA14 ; =0x3FD55555
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA18 ; =0xDB6FABFF
	ldr r1, _0208BA1C ; =0x3FDB6DB6
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA20 ; =0x33333303
	ldr r1, _0208BA24 ; =0x3FE33333
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x34]
	mov r1, fp
	bl _dmul
	mov r4, r0
	mov sl, r1
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x28]
	mov r1, sb
	mov r3, sb
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x14]
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dadd
	mov r4, r0
	ldr r0, [sp, #0x48]
	mov sl, r1
	mov r1, sb
	mov r2, r0
	mov r3, r1
	bl _dmul
	str r1, [sp, #0xc]
	mov fp, r0
	ldr r1, _0208BA28 ; =0x40080000
	ldr r3, [sp, #0xc]
	mov r0, #0
	mov r2, fp
	bl _dadd
	mov r2, r4
	mov r3, sl
	bl _dadd
	mov r0, #0
	ldr r3, _0208BA28 ; =0x40080000
	mov r2, r0
	str r1, [sp, #0x44]
	str r0, [sp, #0x40]
	bl _dsub
	ldr r3, [sp, #0xc]
	mov r2, fp
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dsub
	str r0, [sp, #0x38]
	str r1, [sp, #4]
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	mov r1, sb
	bl _dmul
	mov r4, r0
	mov sl, r1
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl _dmul
	str r0, [sp, #0x3c]
	mov fp, r1
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #4]
	ldr r2, [sp, #0x28]
	mov r3, sb
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x3c]
	mov r1, fp
	bl _dadd
	mov sb, r0
	mov fp, r1
	mov r0, r4
	mov r1, sl
	mov r2, sb
	mov r3, fp
	bl _dadd
	mov r0, #0
	mov r2, r4
	mov r3, sl
	str r1, [sp, #0x6c]
	str r0, [sp, #0x68]
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, sb
	mov r1, fp
	bl _dsub
	mov sl, r1
	mov fp, r0
	ldr r1, _0208BA2C ; =0x3FEEC709
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	mov r0, #0xe0000000
	bl _dmul
	mov r4, r0
	mov sb, r1
	ldr r0, _0208BA30 ; =0x145B01F5
	ldr r1, _0208BA34 ; =0xBE3E2FE0
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	bl _dmul
	mov r2, fp
	mov r3, sl
	mov fp, r0
	mov sl, r1
	ldr r0, _0208BA38 ; =0xDC3A03FD
	ldr r1, _0208BA2C ; =0x3FEEC709
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, fp
	mov r1, sl
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA3C ; =_020AEEE0
	add r1, r0, r8, lsl #3
	ldr r0, [r0, r8, lsl #3]
	ldr r1, [r1, #4]
	bl _dadd
	mov fp, r0
	mov sl, r1
	mov r0, r6
	bl _dflt
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	mov r0, r4
	mov r1, sb
	mov r2, fp
	mov r3, sl
	bl _dadd
	ldr r2, _0208BA40 ; =_020AEEC0
	add r3, r2, r8, lsl #3
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dadd
	str r1, [sp, #0x5c]
	mov r0, #0
	str r0, [sp, #0x58]
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dsub
	ldr r2, _0208BA40 ; =_020AEEC0
	add r3, r2, r8, lsl #3
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	bl _dsub
	mov r2, r4
	mov r3, sb
	bl _dsub
	mov r2, r0
	mov r0, fp
	mov r3, r1
	mov r1, sl
	bl _dsub
	mov r4, r0
	mov r8, r1
_0208BFF8:
	sub r0, r5, #1
	ldr r1, [sp, #0xb4]
	orrs r0, r7, r0
	ldr r5, _0208B9B0 ; =0x3FF00000
	mov r2, #0
	ldr r0, [sp, #0xb0]
	mov r3, r1
	mov r6, #0
	subeq r5, r5, #0x80000000
	str r1, [sp, #0x64]
	str r2, [sp, #0x60]
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x5c]
	bl _dmul
	mov r7, r0
	mov sb, r1
	ldr r0, [sp, #0xb0]
	ldr r1, [sp, #0xb4]
	mov r2, r4
	mov r3, r8
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, sb
	bl _dadd
	mov r7, r0
	mov r8, r1
	ldr r0, [sp, #0x60]
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x58]
	ldr r3, [sp, #0x5c]
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, r8
	str r2, [sp, #0x68]
	str r3, [sp, #0x6c]
	bl _dadd
	mov sb, r1
	ldr r2, _0208BA44 ; =0x40900000
	str r0, [sp, #0x78]
	str sb, [sp, #0x7c]
	cmp sb, r2
	blt _0208C184
	add r1, sb, #0xf700000
	add r1, r1, #0xb0000000
	orrs r0, r1, r0
	beq _0208C104
	ldr r0, _0208BA48 ; =0x8800759C
	ldr r1, _0208BA4C ; =0x7E37E43C
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA48 ; =0x8800759C
	ldr r1, _0208BA4C ; =0x7E37E43C
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208C104:
	ldr r0, _0208B9E8 ; =0x652B82FE
	ldr r1, _0208BA50 ; =0x3C971547
	mov r2, r7
	mov r3, r8
	bl _dadd
	mov r4, r0
	mov sl, r1
	ldr r0, [sp, #0x78]
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	mov r1, sb
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dgr
	bls _0208C238
	ldr r0, _0208BA48 ; =0x8800759C
	ldr r1, _0208BA4C ; =0x7E37E43C
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA48 ; =0x8800759C
	ldr r1, _0208BA4C ; =0x7E37E43C
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208C184:
	bic r3, sb, #0x80000000
	add r2, r2, #0xcc00
	cmp r3, r2
	blt _0208C238
	ldr r2, _0208BA54 ; =0x3F6F3400
	add r2, sb, r2
	orrs r2, r2, r0
	beq _0208C1DC
	ldr r0, _0208BA58 ; =0xC2F8F359
	ldr r1, _0208BA5C ; =0x01A56E1F
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA58 ; =0xC2F8F359
	ldr r1, _0208BA5C ; =0x01A56E1F
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208C1DC:
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, r8
	bl _dleq
	bhi _0208C238
	ldr r0, _0208BA58 ; =0xC2F8F359
	ldr r1, _0208BA5C ; =0x01A56E1F
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA58 ; =0xC2F8F359
	ldr r1, _0208BA5C ; =0x01A56E1F
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_0208C238:
	ldr r0, _0208B9BC ; =0xFFFFFC01
	bic r3, sb, #0x80000000
	ldr r1, _0208B9C0 ; =0x3FE00000
	add r2, r0, r3, asr #20
	cmp r3, r1
	mov r4, #0
	ble _0208C2B4
	mov r1, #0x100000
	add r2, r2, #1
	add r2, sb, r1, asr r2
	bic r3, r2, #0x80000000
	add r0, r0, r3, asr #20
	sub r3, r1, #1
	mvn r3, r3, asr r0
	sub r1, r1, #1
	and r1, r2, r1
	and r2, r2, r3
	str r2, [sp, #0x54]
	str r4, [sp, #0x50]
	orr r1, r1, #0x100000
	rsb r0, r0, #0x14
	mov r4, r1, asr r0
	cmp sb, #0
	ldr r0, [sp, #0x68]
	ldr r1, [sp, #0x6c]
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	rsblt r4, r4, #0
	bl _dsub
	str r0, [sp, #0x68]
	str r1, [sp, #0x6c]
_0208C2B4:
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	mov r0, r7
	mov r1, r8
	bl _dadd
	mov r3, r1
	mov r0, #0
	ldr r1, _0208BA60 ; =0x3FE62E43
	mov r2, r0
	str r3, [sp, #0x54]
	str r0, [sp, #0x50]
	bl _dmul
	mov sb, r0
	mov sl, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	bl _dsub
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, r8
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA64 ; =0xFEFA39EF
	ldr r1, _0208BA68 ; =0x3FE62E42
	bl _dmul
	mov r7, r0
	mov r8, r1
	ldr r0, _0208BA6C ; =0x0CA86C39
	ldr r1, _0208BA70 ; =0xBE205C61
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, r8
	bl _dadd
	mov r7, r0
	mov r8, r1
	mov r0, sb
	mov r1, sl
	mov r2, r7
	mov r3, r8
	bl _dadd
	mov r2, sb
	mov r3, sl
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, r8
	bl _dsub
	mov r8, r0
	mov sb, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r0
	mov r3, r1
	bl _dmul
	mov r2, r0
	str r2, [sp, #0x50]
	mov r3, r1
	str r3, [sp, #0x54]
	ldr r0, _0208BA74 ; =0x72BEA4D0
	ldr r1, _0208BA78 ; =0x3E663769
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA7C ; =0xC5D26BF1
	ldr r1, _0208BA80 ; =0xBEBBBD41
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA84 ; =0xAF25DE2C
	ldr r1, _0208BA88 ; =0x3F11566A
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA8C ; =0x16BEBD93
	ldr r1, _0208BA90 ; =0xBF66C16C
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _0208BA94 ; =0x5555553E
	ldr r1, _0208BA98 ; =0x3FC55555
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	bl _dsub
	mov r2, r0
	str r2, [sp, #0x58]
	mov r3, r1
	str r3, [sp, #0x5c]
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	bl _dmul
	mov r7, r0
	mov sl, r1
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x5c]
	mov r2, #0
	mov r3, #0x40000000
	bl _dsub
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, sl
	bl _ddiv
	mov r7, r0
	mov sl, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r8
	mov r3, sb
	bl _dmul
	mov r2, r0
	mov r0, r8
	mov r3, r1
	mov r1, sb
	bl _dadd
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, sl
	bl _dsub
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	bl _dsub
	mov r3, r1
	mov r2, r0
	ldr r1, _0208B9B0 ; =0x3FF00000
	mov r0, #0
	bl _dsub
	add r3, r1, r4, lsl #20
	mov r2, r3, asr #0x14
	str r0, [sp, #0x78]
	cmp r2, #0
	str r1, [sp, #0x7c]
	addgt r0, sp, #0x78
	strgt r3, [r0, #4]
	bgt _0208C568
	mov r2, r4
	bl sub_0208DE1C
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
_0208C568:
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	mov r0, r6
	mov r1, r5
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_0208B404

	arm_func_start sub_0208C58C
sub_0208C58C: ; 0x0208C58C
	stmdb sp!, {r0, r1, r2, r3}
	ldr r1, [sp, #4]
	ldr r0, [sp, #0xc]
	bic r1, r1, #0x80000000
	and r0, r0, #0x80000000
	orr r1, r1, r0
	ldr r0, [sp]
	str r1, [sp, #4]
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_0208C58C

	arm_func_start sub_0208C5B4
sub_0208C5B4: ; 0x0208C5B4
	stmdb sp!, {r0, r1, r2, r3}
	add r2, sp, #0
	ldr r1, [r2, #4]
	ldr r0, [sp]
	bic r1, r1, #0x80000000
	str r1, [r2, #4]
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_0208C5B4

	arm_func_start sub_0208C5D4
sub_0208C5D4: ; 0x0208C5D4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	ldr r1, [sp, #0xc]
	ldr r0, _0208C680 ; =0x7FF00000
	mov r4, r2
	bic r3, r1, #0x80000000
	mov r2, #0
	str r2, [r4]
	cmp r3, r0
	ldr r0, [sp, #8]
	bge _0208C608
	orrs r0, r3, r0
	bne _0208C61C
_0208C608:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0208C61C:
	cmp r3, #0x100000
	bge _0208C648
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r3, _0208C684 ; =0x43500000
	bl _dmul
	mvn r2, #0x35
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [r4]
	bic r3, r1, #0x80000000
_0208C648:
	ldr r2, _0208C688 ; =0x800FFFFF
	ldr r0, _0208C68C ; =0xFFFFFC02
	and r1, r1, r2
	orr r1, r1, #0xfe00000
	orr r1, r1, #0x30000000
	ldr r2, [r4]
	add r0, r0, r3, asr #20
	add r2, r2, r0
	ldr r0, [sp, #8]
	str r2, [r4]
	str r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_0208C680: .word 0x7FF00000
_0208C684: .word 0x43500000
_0208C688: .word 0x800FFFFF
_0208C68C: .word 0xFFFFFC02
	arm_func_end sub_0208C5D4

	arm_func_start sub_0208C690
sub_0208C690: ; 0x0208C690
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r4, r2
	bl sub_0208DDAC
	cmp r0, #2
	ble _0208C6C8
	mov r0, #0
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r1, r0
	bl _deq
	bne _0208C6DC
_0208C6C8:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0208C6DC:
	ldr r3, [sp, #0xc]
	ldr r0, _0208C8B0 ; =0x7FF00000
	ldr r1, [sp, #8]
	and r0, r3, r0
	movs ip, r0, asr #0x14
	bne _0208C768
	bic r0, r3, #0x80000000
	orrs r0, r1, r0
	ldreq r0, [sp, #8]
	ldreq r1, [sp, #0xc]
	ldmeqia sp!, {r4, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r3, _0208C8B4 ; =0x43500000
	mov r2, #0
	bl _dmul
	mov r3, r1
	ldr r1, _0208C8B0 ; =0x7FF00000
	ldr ip, _0208C8B8 ; =0xFFFF3CB0
	and r1, r3, r1
	mov r2, r0
	mov r0, r1, asr #0x14
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r4, ip
	sub ip, r0, #0x36
	bge _0208C768
	ldr r0, _0208C8BC ; =0xC2F8F359
	ldr r1, _0208C8C0 ; =0x01A56E1F
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0208C768:
	ldr r0, _0208C8C4 ; =0x000007FF
	cmp ip, r0
	bne _0208C794
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r2, r0
	mov r3, r1
	bl _dadd
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0208C794:
	add r2, ip, r4
	sub r0, r0, #1
	cmp r2, r0
	ble _0208C7D8
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r0, _0208C8C8 ; =0x8800759C
	ldr r1, _0208C8CC ; =0x7E37E43C
	bl sub_0208C58C
	mov r2, r0
	mov r3, r1
	ldr r0, _0208C8C8 ; =0x8800759C
	ldr r1, _0208C8CC ; =0x7E37E43C
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0208C7D8:
	cmp r2, #0
	ble _0208C800
	ldr r1, _0208C8D0 ; =0x800FFFFF
	ldr r0, [sp, #8]
	and r1, r3, r1
	orr r1, r1, r2, lsl #20
	str r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0208C800:
	mvn r0, #0x35
	cmp r2, r0
	bgt _0208C880
	ldr r0, _0208C8D4 ; =0x0000C350
	cmp r4, r0
	ble _0208C84C
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r0, _0208C8C8 ; =0x8800759C
	ldr r1, _0208C8CC ; =0x7E37E43C
	bl sub_0208C58C
	mov r2, r0
	mov r3, r1
	ldr r0, _0208C8C8 ; =0x8800759C
	ldr r1, _0208C8CC ; =0x7E37E43C
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0208C84C:
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r0, _0208C8BC ; =0xC2F8F359
	ldr r1, _0208C8C0 ; =0x01A56E1F
	bl sub_0208C58C
	mov r2, r0
	mov r3, r1
	ldr r0, _0208C8BC ; =0xC2F8F359
	ldr r1, _0208C8C0 ; =0x01A56E1F
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0208C880:
	ldr r0, _0208C8D0 ; =0x800FFFFF
	add r1, r2, #0x36
	and r0, r3, r0
	orr r3, r0, r1, lsl #20
	ldr r2, [sp, #8]
	ldr r1, _0208C8D8 ; =0x3C900000
	mov r0, #0
	str r3, [sp, #0xc]
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_0208C8B0: .word 0x7FF00000
_0208C8B4: .word 0x43500000
_0208C8B8: .word 0xFFFF3CB0
_0208C8BC: .word 0xC2F8F359
_0208C8C0: .word 0x01A56E1F
_0208C8C4: .word 0x000007FF
_0208C8C8: .word 0x8800759C
_0208C8CC: .word 0x7E37E43C
_0208C8D0: .word 0x800FFFFF
_0208C8D4: .word 0x0000C350
_0208C8D8: .word 0x3C900000
	arm_func_end sub_0208C690

	arm_func_start sub_0208C8DC
sub_0208C8DC: ; 0x0208C8DC
	ldr ip, _0208C8E4 ; =sub_0208B404
	bx ip
	.align 2, 0
_0208C8E4: .word sub_0208B404
	arm_func_end sub_0208C8DC

	arm_func_start sub_0208C8E8
sub_0208C8E8: ; 0x0208C8E8
	add r3, r0, #5
	ldrb r2, [r3, r1]
	add ip, r3, r1
	cmp r2, #5
	movhi r0, #1
	bxhi lr
	mvnlo r0, #0
	bxlo lr
	ldrb r2, [r0, #4]
	add ip, ip, #1
	add r3, r3, r2
	cmp ip, r3
	bhs _0208C938
_0208C91C:
	ldrb r2, [ip]
	cmp r2, #0
	movne r0, #1
	bxne lr
	add ip, ip, #1
	cmp ip, r3
	blo _0208C91C
_0208C938:
	sub r1, r1, #1
	add r0, r0, r1
	ldrb r0, [r0, #5]
	tst r0, #1
	movne r0, #1
	mvneq r0, #0
	bx lr
	arm_func_end sub_0208C8E8

	arm_func_start sub_0208C954
sub_0208C954: ; 0x0208C954
	add r3, r0, #5
	add r1, r3, r1
	sub ip, r1, #1
	mov r1, #0
_0208C964:
	ldrb r2, [ip]
	cmp r2, #9
	addlo r0, r2, #1
	strlob r0, [ip]
	bxlo lr
	cmp ip, r3
	bne _0208C998
	mov r1, #1
	strb r1, [ip]
	ldrsh r1, [r0, #2]
	add r1, r1, #1
	strh r1, [r0, #2]
	bx lr
_0208C998:
	strb r1, [ip], #-1
	b _0208C964
	arm_func_end sub_0208C954

	arm_func_start sub_0208C9A0
sub_0208C9A0: ; 0x0208C9A0
	bx lr
	arm_func_end sub_0208C9A0

	arm_func_start sub_0208C9A4
sub_0208C9A4: ; 0x0208C9A4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	cmp r4, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldrb r2, [r5, #4]
	cmp r4, r2
	ldmgeia sp!, {r3, r4, r5, pc}
	bl sub_0208C8E8
	strb r4, [r5, #4]
	cmp r0, #0
	ldmltia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl sub_0208C954
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0208C9A4

	arm_func_start sub_0208C9E4
sub_0208C9E4: ; 0x0208C9E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, #0
	mov r8, r2
	strb r0, [sl]
	mov sb, r1
	cmp r8, #0
	strb r0, [sl, #4]
	cmpeq sb, #0
	beq _0208CA70
	mov r6, #0xa
	mov fp, r0
	mov r5, r0
	mov r4, r0
_0208CA1C:
	ldrb r1, [sl, #4]
	mov r0, sb
	mov r2, r6
	add r3, r1, #1
	mov r7, r1
	strb r3, [sl, #4]
	mov r1, r8
	mov r3, fp
	bl _ull_mod
	add r1, sl, r7
	strb r0, [r1, #5]
	mov r0, sb
	mov r1, r8
	mov r2, #0xa
	mov r3, #0
	bl _ll_udiv
	mov r8, r1
	mov sb, r0
	cmp r8, r5
	cmpeq sb, r4
	bne _0208CA1C
_0208CA70:
	ldrb r0, [sl, #4]
	add r2, sl, #5
	add r0, r2, r0
	sub r3, r0, #1
	cmp r2, r3
	bhs _0208CAA0
_0208CA88:
	ldrb r0, [r3]
	ldrb r1, [r2]
	strb r0, [r2], #1
	strb r1, [r3], #-1
	cmp r2, r3
	blo _0208CA88
_0208CAA0:
	ldrb r0, [sl, #4]
	sub r0, r0, #1
	strh r0, [sl, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end sub_0208C9E4

	arm_func_start sub_0208CAB0
sub_0208CAB0: ; 0x0208CAB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	ldrb r6, [r1, #4]
	ldrb r5, [r2, #4]
	mov r4, #0
	add r3, sp, #0
	add r5, r6, r5
	sub r5, r5, #1
	add r3, r3, r5
	add r6, r3, #1
	mov r7, r6
	strb r4, [r0]
	cmp r5, #0
	ble _0208CB78
	add lr, r1, #5
	add fp, r2, #5
_0208CAF0:
	ldrb r3, [r2, #4]
	sub sl, r3, #1
	sub r3, r5, sl
	subs sb, r3, #1
	ldrb r3, [r1, #4]
	movmi sb, #0
	submi sl, r5, #1
	add r8, sl, #1
	sub r3, r3, sb
	cmp r8, r3
	movgt r8, r3
	add sl, fp, sl
	add sb, lr, sb
	cmp r8, #0
	ble _0208CB44
_0208CB2C:
	ldrb ip, [sb], #1
	ldrb r3, [sl], #-1
	sub r8, r8, #1
	cmp r8, #0
	mla r4, ip, r3, r4
	bgt _0208CB2C
_0208CB44:
	ldr r3, _0208CC30 ; =0xCCCCCCCD
	sub r5, r5, #1
	umull r8, sb, r4, r3
	mov sb, sb, lsr #3
	cmp r5, #0
	mov sl, #0xa
	umull r8, sb, sl, sb
	sub sb, r4, r8
	strb sb, [r6, #-1]!
	mov r8, r4
	umull r3, r4, r8, r3
	mov r4, r4, lsr #3
	bgt _0208CAF0
_0208CB78:
	ldrsh r3, [r1, #2]
	ldrsh r1, [r2, #2]
	cmp r4, #0
	add r1, r3, r1
	strh r1, [r0, #2]
	beq _0208CBA0
	strb r4, [r6, #-1]!
	ldrsh r1, [r0, #2]
	add r1, r1, #1
	strh r1, [r0, #2]
_0208CBA0:
	mov r3, #0
	b _0208CBB8
_0208CBA8:
	ldrb r2, [r6], #1
	add r1, r0, r3
	add r3, r3, #1
	strb r2, [r1, #5]
_0208CBB8:
	cmp r3, #0x20
	bge _0208CBC8
	cmp r6, r7
	blo _0208CBA8
_0208CBC8:
	cmp r6, r7
	addhs sp, sp, #0x40
	strb r3, [r0, #4]
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r1, [r6]
	cmp r1, #5
	addlo sp, sp, #0x40
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bne _0208CC20
	add r2, r6, #1
	cmp r2, r7
	bhs _0208CC10
_0208CBF8:
	ldrb r1, [r2]
	cmp r1, #0
	bne _0208CC20
	add r2, r2, #1
	cmp r2, r7
	blo _0208CBF8
_0208CC10:
	ldrb r1, [r6, #-1]
	tst r1, #1
	addeq sp, sp, #0x40
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0208CC20:
	ldrb r1, [r0, #4]
	bl sub_0208C954
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0208CC30: .word 0xCCCCCCCD
	arm_func_end sub_0208CAB0

	arm_func_start sub_0208CC34
sub_0208CC34: ; 0x0208CC34
	stmdb sp!, {r3, lr}
	strh r2, [r0, #2]
	mov ip, #0
	strb ip, [r0]
	b _0208CC5C
_0208CC48:
	ldrsb r3, [r1], #1
	add r2, r0, ip
	add ip, ip, #1
	sub r3, r3, #0x30
	strb r3, [r2, #5]
_0208CC5C:
	cmp ip, #0x20
	bge _0208CC70
	ldrsb r2, [r1]
	cmp r2, #0
	bne _0208CC48
_0208CC70:
	strb ip, [r0, #4]
	ldrsb r2, [r1]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	cmp r2, #5
	ldmltia sp!, {r3, pc}
	bgt _0208CCC4
	ldrsb r2, [r1, #1]
	add r1, r1, #1
	cmp r2, #0
	beq _0208CCB0
_0208CC9C:
	cmp r2, #0x30
	bne _0208CCC4
	ldrsb r2, [r1, #1]!
	cmp r2, #0
	bne _0208CC9C
_0208CCB0:
	sub r1, ip, #1
	add r1, r0, r1
	ldrb r1, [r1, #5]
	tst r1, #1
	ldmeqia sp!, {r3, pc}
_0208CCC4:
	ldrb r1, [r0, #4]
	bl sub_0208C954
	ldmia sp!, {r3, pc}
	arm_func_end sub_0208CC34

	arm_func_start sub_0208CCD0
sub_0208CCD0: ; 0x0208CCD0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x4c
	mov r4, r1
	mvn r2, #0x34
	mov r5, r0
	cmp r4, r2
	bgt _0208CD00
	bge _0208CDCC
	sub r0, r2, #0xb
	cmp r4, r0
	beq _0208CDB4
	b _0208CF5C
_0208CD00:
	add r1, r4, #0x20
	cmp r1, #0x28
	addls pc, pc, r1, lsl #2
	b _0208CF5C
_0208CD10: ; jump table
	b _0208CDE0 ; case 0
	b _0208CF5C ; case 1
	b _0208CF5C ; case 2
	b _0208CF5C ; case 3
	b _0208CF5C ; case 4
	b _0208CF5C ; case 5
	b _0208CF5C ; case 6
	b _0208CF5C ; case 7
	b _0208CF5C ; case 8
	b _0208CF5C ; case 9
	b _0208CF5C ; case 10
	b _0208CF5C ; case 11
	b _0208CF5C ; case 12
	b _0208CF5C ; case 13
	b _0208CF5C ; case 14
	b _0208CF5C ; case 15
	b _0208CDF4 ; case 16
	b _0208CF5C ; case 17
	b _0208CF5C ; case 18
	b _0208CF5C ; case 19
	b _0208CF5C ; case 20
	b _0208CF5C ; case 21
	b _0208CF5C ; case 22
	b _0208CF5C ; case 23
	b _0208CE08 ; case 24
	b _0208CE1C ; case 25
	b _0208CE30 ; case 26
	b _0208CE44 ; case 27
	b _0208CE58 ; case 28
	b _0208CE6C ; case 29
	b _0208CE80 ; case 30
	b _0208CE94 ; case 31
	b _0208CEA8 ; case 32
	b _0208CEBC ; case 33
	b _0208CED0 ; case 34
	b _0208CEE4 ; case 35
	b _0208CEF8 ; case 36
	b _0208CF0C ; case 37
	b _0208CF20 ; case 38
	b _0208CF34 ; case 39
	b _0208CF48 ; case 40
_0208CDB4:
	ldr r1, _0208D000 ; =_020B3268
	mov r0, r5
	mvn r2, #0x13
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CDCC:
	ldr r1, _0208D004 ; =_020B3298
	add r2, r2, #0x25
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CDE0:
	ldr r1, _0208D008 ; =_020B32C0
	add r2, r2, #0x2b
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CDF4:
	ldr r1, _0208D00C ; =_020B32D8
	add r2, r2, #0x30
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CE08:
	ldr r1, _0208D010 ; =_020B32E8
	add r2, r2, #0x32
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CE1C:
	ldr r1, _0208D014 ; =_020B32F0
	add r2, r2, #0x32
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CE30:
	ldr r1, _0208D018 ; =_020B32F8
	add r2, r2, #0x33
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CE44:
	ldr r1, _0208D01C ; =_020B3300
	add r2, r2, #0x33
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CE58:
	ldr r1, _0208D020 ; =_020B3308
	add r2, r2, #0x33
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CE6C:
	ldr r1, _0208D024 ; =_020B330C
	add r2, r2, #0x34
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CE80:
	ldr r1, _0208D028 ; =_020B3310
	add r2, r2, #0x34
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CE94:
	ldr r1, _0208D02C ; =_020B3314
	add r2, r2, #0x34
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CEA8:
	ldr r1, _0208D030 ; =_020B3318
	mov r2, #0
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CEBC:
	ldr r1, _0208D034 ; =_020B331C
	mov r2, #0
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CED0:
	ldr r1, _0208D038 ; =_020B3320
	mov r2, #0
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CEE4:
	ldr r1, _0208D03C ; =_020B3324
	mov r2, #0
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CEF8:
	ldr r1, _0208D040 ; =_020B3328
	mov r2, #1
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CF0C:
	ldr r1, _0208D044 ; =_020B332C
	mov r2, #1
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CF20:
	ldr r1, _0208D048 ; =_020B3330
	mov r2, #1
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CF34:
	ldr r1, _0208D04C ; =_020B3334
	mov r2, #2
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CF48:
	ldr r1, _0208D050 ; =_020B3338
	mov r2, #2
	bl sub_0208CC34
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_0208CF5C:
	and r0, r4, #0x80000000
	add r1, r4, r0, lsr #31
	add r0, sp, #0x26
	mov r1, r1, asr #1
	bl sub_0208CCD0
	add r1, sp, #0x26
	mov r0, r5
	mov r2, r1
	bl sub_0208CAB0
	tst r4, #1
	addeq sp, sp, #0x4c
	ldmeqia sp!, {r4, r5, pc}
	add r3, sp, #0
	mov ip, r5
	mov r2, #9
_0208CF98:
	ldrh r1, [ip]
	ldrh r0, [ip, #2]
	add ip, ip, #4
	subs r2, r2, #1
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	bne _0208CF98
	ldrh r0, [ip]
	cmp r4, #0
	strh r0, [r3]
	add r0, sp, #0x26
	ble _0208CFDC
	ldr r1, _0208D034 ; =_020B331C
	mov r2, #0
	bl sub_0208CC34
	b _0208CFE8
_0208CFDC:
	ldr r1, _0208D02C ; =_020B3314
	mvn r2, #0
	bl sub_0208CC34
_0208CFE8:
	add r1, sp, #0
	add r2, sp, #0x26
	mov r0, r5
	bl sub_0208CAB0
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_0208D000: .word _020B3268
_0208D004: .word _020B3298
_0208D008: .word _020B32C0
_0208D00C: .word _020B32D8
_0208D010: .word _020B32E8
_0208D014: .word _020B32F0
_0208D018: .word _020B32F8
_0208D01C: .word _020B3300
_0208D020: .word _020B3308
_0208D024: .word _020B330C
_0208D028: .word _020B3310
_0208D02C: .word _020B3314
_0208D030: .word _020B3318
_0208D034: .word _020B331C
_0208D038: .word _020B3320
_0208D03C: .word _020B3324
_0208D040: .word _020B3328
_0208D044: .word _020B332C
_0208D048: .word _020B3330
_0208D04C: .word _020B3334
_0208D050: .word _020B3338
	arm_func_end sub_0208CCD0

	arm_func_start sub_0208D054
sub_0208D054: ; 0x0208D054
	stmdb sp!, {r4, lr}
	ldrb r3, [r0, #5]
	cmp r3, #0
	bne _0208D078
	ldrb r0, [r1, #5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
_0208D078:
	ldrb r2, [r1, #5]
	cmp r2, #0
	bne _0208D094
	cmp r3, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
_0208D094:
	ldrsh r3, [r0, #2]
	ldrsh r2, [r1, #2]
	cmp r3, r2
	bne _0208D12C
	ldrb r4, [r0, #4]
	ldrb r2, [r1, #4]
	mov ip, #0
	mov lr, r4
	cmp r4, r2
	movgt lr, r2
	cmp lr, #0
	ble _0208D0EC
_0208D0C4:
	add r3, r0, ip
	add r2, r1, ip
	ldrb r3, [r3, #5]
	ldrb r2, [r2, #5]
	cmp r3, r2
	movne r0, #0
	ldmneia sp!, {r4, pc}
	add ip, ip, #1
	cmp ip, lr
	blt _0208D0C4
_0208D0EC:
	cmp lr, r4
	moveq r0, r1
	ldrb r1, [r0, #4]
	cmp ip, r1
	bge _0208D124
_0208D100:
	add r1, r0, ip
	ldrb r1, [r1, #5]
	cmp r1, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldrb r1, [r0, #4]
	add ip, ip, #1
	cmp ip, r1
	blt _0208D100
_0208D124:
	mov r0, #1
	ldmia sp!, {r4, pc}
_0208D12C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0208D054

	arm_func_start sub_0208D134
sub_0208D134: ; 0x0208D134
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r2, [r0, #5]
	cmp r2, #0
	bne _0208D158
	ldrb r0, [r1, #5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0208D158:
	ldrb r2, [r1, #5]
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r3, [r1, #2]
	ldrsh r2, [r0, #2]
	cmp r2, r3
	bne _0208D208
	ldrb r5, [r0, #4]
	ldrb r4, [r1, #4]
	mov ip, #0
	mov lr, r5
	cmp r5, r4
	movgt lr, r4
	cmp lr, #0
	ble _0208D1CC
_0208D198:
	add r3, r1, ip
	add r2, r0, ip
	ldrb r3, [r3, #5]
	ldrb r2, [r2, #5]
	cmp r2, r3
	movlo r0, #1
	ldmloia sp!, {r3, r4, r5, pc}
	cmp r3, r2
	movlo r0, #0
	ldmloia sp!, {r3, r4, r5, pc}
	add ip, ip, #1
	cmp ip, lr
	blt _0208D198
_0208D1CC:
	cmp lr, r5
	bne _0208D200
	cmp ip, r4
	bge _0208D200
_0208D1DC:
	add r0, r1, ip
	ldrb r0, [r0, #5]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r1, #4]
	add ip, ip, #1
	cmp ip, r0
	blt _0208D1DC
_0208D200:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_0208D208:
	movlt r0, #1
	movge r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0208D134

	arm_func_start sub_0208D214
sub_0208D214: ; 0x0208D214
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, #9
_0208D220:
	ldrh r4, [r1]
	ldrh r3, [r1, #2]
	add r1, r1, #4
	subs r5, r5, #1
	strh r4, [r6]
	strh r3, [r6, #2]
	add r6, r6, #4
	bne _0208D220
	ldrh r1, [r1]
	strh r1, [r6]
	ldrb r1, [r2, #5]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r7, [r0, #4]
	ldrb r3, [r2, #4]
	ldrsh r4, [r0, #2]
	mov r1, r7
	cmp r7, r3
	movlt r1, r3
	ldrsh r3, [r2, #2]
	sub r6, r4, r3
	add r1, r1, r6
	cmp r1, #0x20
	movgt r1, #0x20
	cmp r7, r1
	bge _0208D2AC
	mov r4, #0
_0208D28C:
	ldrb r5, [r0, #4]
	add r3, r0, r7
	add r5, r5, #1
	strb r5, [r0, #4]
	strb r4, [r3, #5]
	ldrb r7, [r0, #4]
	cmp r7, r1
	blt _0208D28C
_0208D2AC:
	ldrb r4, [r2, #4]
	add r3, r0, #5
	add ip, r3, r1
	add r4, r4, r6
	cmp r4, r1
	addlt ip, r3, r4
	sub r4, ip, r3
	add r1, r2, #5
	sub r4, r4, r6
	add lr, r1, r4
	mov r4, lr
	b _0208D340
_0208D2DC:
	ldrb r7, [ip, #-1]!
	ldrb r5, [lr, #-1]!
	cmp r7, r5
	bhs _0208D330
	ldrb r7, [ip, #-1]
	sub r5, ip, #1
	cmp r7, #0
	bne _0208D308
_0208D2FC:
	ldrb r7, [r5, #-1]!
	cmp r7, #0
	beq _0208D2FC
_0208D308:
	cmp r5, ip
	beq _0208D330
_0208D310:
	ldrb r7, [r5]
	sub r7, r7, #1
	strb r7, [r5]
	ldrb r7, [r5, #1]!
	cmp r5, ip
	add r7, r7, #0xa
	strb r7, [r5]
	bne _0208D310
_0208D330:
	ldrb r7, [ip]
	ldrb r5, [lr]
	sub r5, r7, r5
	strb r5, [ip]
_0208D340:
	cmp ip, r3
	cmphi lr, r1
	bhi _0208D2DC
	ldrb r5, [r2, #4]
	sub lr, r4, r1
	cmp lr, r5
	bge _0208D41C
	ldrb r1, [r4]
	mov r7, #0
	cmp r1, #5
	movlo r7, #1
	blo _0208D3B8
	bne _0208D3B8
	add r1, r2, #5
	add r2, r1, r5
	add r4, r4, #1
	cmp r4, r2
	bhs _0208D3A0
_0208D388:
	ldrb r1, [r4]
	cmp r1, #0
	bne _0208D41C
	add r4, r4, #1
	cmp r4, r2
	blo _0208D388
_0208D3A0:
	add r1, r3, lr
	add r2, r1, r6
	ldrb r1, [r2, #-1]
	sub ip, r2, #1
	tst r1, #1
	movne r7, #1
_0208D3B8:
	cmp r7, #0
	beq _0208D41C
	ldrb r1, [ip]
	cmp r1, #1
	bhs _0208D410
	ldrb r1, [ip, #-1]
	sub r2, ip, #1
	cmp r1, #0
	bne _0208D3E8
_0208D3DC:
	ldrb r1, [r2, #-1]!
	cmp r1, #0
	beq _0208D3DC
_0208D3E8:
	cmp r2, ip
	beq _0208D410
_0208D3F0:
	ldrb r1, [r2]
	sub r1, r1, #1
	strb r1, [r2]
	ldrb r1, [r2, #1]!
	cmp r2, ip
	add r1, r1, #0xa
	strb r1, [r2]
	bne _0208D3F0
_0208D410:
	ldrb r1, [ip]
	sub r1, r1, #1
	strb r1, [ip]
_0208D41C:
	ldrb r1, [r3]
	mov r5, r3
	cmp r1, #0
	bne _0208D438
_0208D42C:
	ldrb r1, [r5, #1]!
	cmp r1, #0
	beq _0208D42C
_0208D438:
	cmp r5, r3
	bls _0208D480
	ldrsh r1, [r0, #2]
	sub r2, r5, r3
	and r4, r2, #0xff
	sub r1, r1, r4
	strh r1, [r0, #2]
	ldrb r1, [r0, #4]
	add r2, r3, r1
	cmp r5, r2
	bhs _0208D474
_0208D464:
	ldrb r1, [r5], #1
	cmp r5, r2
	strb r1, [r3], #1
	blo _0208D464
_0208D474:
	ldrb r1, [r0, #4]
	sub r1, r1, r4
	strb r1, [r0, #4]
_0208D480:
	ldrb r1, [r0, #4]
	add r2, r0, #5
	add r3, r2, r1
	cmp r3, r2
	bls _0208D4A8
_0208D494:
	ldrb r1, [r3, #-1]!
	cmp r1, #0
	bne _0208D4A8
	cmp r3, r2
	bhi _0208D494
_0208D4A8:
	sub r1, r3, r2
	add r1, r1, #1
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0208D214

	arm_func_start sub_0208D4B8
sub_0208D4B8: ; 0x0208D4B8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x58
	mov r8, r1
	mov r6, r2
	mov r7, r0
	mov r0, r8
	mov r1, r6
	bl sub_0208DD98
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r4, r1, lsl #0x18
	mov r0, #0
	mov r1, r0
	mov r2, r8
	mov r3, r6
	mov r5, r4, asr #0x18
	bl _deq
	bne _0208D524
	strb r5, [r7]
	mov r1, #0
	strh r1, [r7, #2]
	mov r0, #1
	strb r0, [r7, #4]
	add sp, sp, #0x58
	strb r1, [r7, #5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0208D524:
	mov r0, r8
	mov r1, r6
	bl sub_0208DDAC
	cmp r0, #2
	bgt _0208D570
	strb r5, [r7]
	mov r2, #0
	strh r2, [r7, #2]
	mov r2, #1
	mov r0, r8
	mov r1, r6
	strb r2, [r7, #4]
	bl sub_0208DDAC
	cmp r0, #1
	moveq r0, #0x4e
	movne r0, #0x49
	add sp, sp, #0x58
	strb r0, [r7, #5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0208D570:
	cmp r5, #0
	beq _0208D594
	mov r0, #0
	mov r1, r0
	mov r2, r8
	mov r3, r6
	bl _dsub
	mov r8, r0
	mov r6, r1
_0208D594:
	add r2, sp, #8
	mov r0, r8
	mov r1, r6
	bl sub_0208C5D4
	mov r4, r0
	mov r6, r1
	orr ip, r4, #0
	rsbs r2, ip, #0
	orr r3, r6, #0x100000
	rsc r1, r3, #0
	mov r0, #0
	and r3, r3, r1
	sub r1, r0, #1
	and ip, ip, r2
	mov r2, r1
	adds r0, ip, r1
	adc r1, r3, r2
	str r4, [sp]
	str r6, [sp, #4]
	bl sub_0208DD04
	rsb r8, r0, #0x35
	ldr r1, [sp, #8]
	add r0, sp, #0xc
	sub r1, r1, r8
	bl sub_0208CCD0
	mov r0, r4
	mov r1, r6
	mov r2, r8
	bl sub_0208C690
	bl _ll_ufrom_d
	mov r2, r1
	mov r1, r0
	add r0, sp, #0x32
	bl sub_0208C9E4
	mov r0, r7
	add r1, sp, #0x32
	add r2, sp, #0xc
	bl sub_0208CAB0
	strb r5, [r7]
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_0208D4B8

	arm_func_start sub_0208D638
sub_0208D638: ; 0x0208D638
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r3
	ldrsh r5, [r0, #2]
	mov r0, r4
	bl sub_0208D4B8
	ldrb r0, [r4, #5]
	cmp r0, #9
	ldmhiia sp!, {r3, r4, r5, pc}
	cmp r5, #0x20
	movgt r5, #0x20
	mov r0, r4
	mov r1, r5
	bl sub_0208C9A4
	ldrb r0, [r4, #4]
	cmp r0, r5
	bge _0208D69C
	mov r1, #0
_0208D67C:
	ldrb r2, [r4, #4]
	add r0, r4, r0
	add r2, r2, #1
	strb r2, [r4, #4]
	strb r1, [r0, #5]
	ldrb r0, [r4, #4]
	cmp r0, r5
	blt _0208D67C
_0208D69C:
	ldrsh r1, [r4, #2]
	sub r0, r0, #1
	mov r2, #0
	sub r0, r1, r0
	strh r0, [r4, #2]
	ldrb r0, [r4, #4]
	cmp r0, #0
	ldmleia sp!, {r3, r4, r5, pc}
_0208D6BC:
	add r1, r4, r2
	ldrb r0, [r1, #5]
	add r2, r2, #1
	add r0, r0, #0x30
	strb r0, [r1, #5]
	ldrb r0, [r4, #4]
	cmp r2, r0
	blt _0208D6BC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0208D638

	arm_func_start sub_0208D6E0
sub_0208D6E0: ; 0x0208D6E0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xfc
	mov r4, r0
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _0208D720
	ldrsb r0, [r4]
	mov r2, #0
	cmp r0, #0
	ldreq r3, _0208DCE4 ; =0x3FF00000
	mov r0, #0
	ldrne r3, _0208DCE8 ; =0xBFF00000
	mov r1, r0
	bl sub_0208C58C
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0208D720:
	ldrb r0, [r4, #5]
	cmp r0, #0x30
	beq _0208D740
	cmp r0, #0x49
	beq _0208D768
	cmp r0, #0x4e
	beq _0208D79C
	b _0208D7E4
_0208D740:
	ldrsb r0, [r4]
	mov r2, #0
	cmp r0, #0
	ldreq r3, _0208DCE4 ; =0x3FF00000
	mov r0, #0
	ldrne r3, _0208DCE8 ; =0xBFF00000
	mov r1, r0
	bl sub_0208C58C
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0208D768:
	ldrsb r0, [r4]
	mov r5, #0
	cmp r0, #0
	ldreq r4, _0208DCE4 ; =0x3FF00000
	ldr r0, _0208DCEC ; =_020B2FB8
	ldrne r4, _0208DCE8 ; =0xBFF00000
	ldr r0, [r0]
	bl _f2d
	mov r2, r5
	mov r3, r4
	bl sub_0208C58C
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0208D79C:
	ldr r1, _0208DCF0 ; =0x7FF00000
	add r3, sp, #0x10
	mov r2, #0
	str r2, [r3]
	str r1, [r3, #4]
	ldrsb r0, [r4]
	cmp r0, #0
	beq _0208D7CC
	orr r0, r1, #0x80000000
	orr r1, r2, r2
	str r1, [r3]
	str r0, [r3, #4]
_0208D7CC:
	ldmia r3, {r0, r1}
	orr r0, r0, #0
	orr r1, r1, #0x80000
	stmia r3, {r0, r1}
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0208D7E4:
	add r3, sp, #0xd6
	mov r5, r4
	mov r2, #9
_0208D7F0:
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	add r5, r5, #4
	subs r2, r2, #1
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	bne _0208D7F0
	ldrh r0, [r5]
	add r1, sp, #0xdb
	strh r0, [r3]
	ldrb r0, [sp, #0xda]
	add r5, r1, r0
	cmp r1, r5
	bhs _0208D840
_0208D82C:
	ldrb r0, [r1]
	sub r0, r0, #0x30
	strb r0, [r1], #1
	cmp r1, r5
	blo _0208D82C
_0208D840:
	ldrb r1, [sp, #0xda]
	ldrsh r2, [sp, #0xd8]
	add r0, sp, #0xb0
	sub r1, r1, #1
	add r1, r2, r1
	strh r1, [sp, #0xd8]
	ldr r1, _0208DCF4 ; =_020B333C
	mov r2, #0x134
	ldrsh fp, [sp, #0xd8]
	bl sub_0208CC34
	add r0, sp, #0xb0
	add r1, sp, #0xd6
	bl sub_0208D134
	cmp r0, #0
	beq _0208D8B0
	ldrsb r0, [r4]
	mov r5, #0
	cmp r0, #0
	ldreq r4, _0208DCE4 ; =0x3FF00000
	ldr r0, _0208DCEC ; =_020B2FB8
	ldrne r4, _0208DCE8 ; =0xBFF00000
	ldr r0, [r0]
	bl _f2d
	mov r2, r5
	mov r3, r4
	bl sub_0208C58C
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0208D8B0:
	add r1, sp, #0xdb
	ldrb r0, [r1]
	add r8, r1, #1
	bl _dfltu
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	cmp r8, r5
	bhs _0208D988
_0208D8D0:
	sub r0, r5, r8
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	adds r7, r1, r0, ror #29
	moveq r7, #8
	mov r6, #0
	mov r2, #0
	cmp r7, #0
	ble _0208D90C
	mov r0, #0xa
_0208D8F8:
	ldrb r1, [r8], #1
	add r2, r2, #1
	cmp r2, r7
	mla r6, r0, r6, r1
	blt _0208D8F8
_0208D90C:
	ldr r0, _0208DCF8 ; =_020B3228
	ldr r1, [sp, #0xc]
	add r3, r0, r7, lsl #3
	ldr r2, [r3, #-8]
	ldr r0, [sp, #8]
	ldr r3, [r3, #-4]
	bl _dmul
	mov r4, r0
	mov sb, r1
	mov r0, r6
	bl _dfltu
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sb
	bl _dadd
	cmp r6, #0
	mov r6, r0
	mov sl, r1
	beq _0208D974
	mov r0, r4
	mov r1, sb
	mov r2, r6
	mov r3, sl
	bl _deq
	beq _0208D988
_0208D974:
	str r6, [sp, #8]
	str sl, [sp, #0xc]
	cmp r8, r5
	sub fp, fp, r7
	blo _0208D8D0
_0208D988:
	cmp fp, #0
	bge _0208D9CC
	rsb r0, fp, #0
	bl _dflt
	mov r3, r1
	mov r2, r0
	ldr r1, _0208DCFC ; =0x40140000
	mov r0, #0
	bl sub_0208C8DC
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl _ddiv
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	b _0208DA04
_0208D9CC:
	mov r0, fp
	bl _dflt
	mov r3, r1
	mov r2, r0
	ldr r1, _0208DCFC ; =0x40140000
	mov r0, #0
	bl sub_0208C8DC
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl _dmul
	str r0, [sp, #8]
	str r1, [sp, #0xc]
_0208DA04:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r2, fp
	bl sub_0208C690
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	bl sub_0208DDAC
	cmp r0, #2
	bne _0208DA38
	ldr r0, _0208DD00 ; =0x7FEFFFFF
	mvn r1, #0
	str r1, [sp, #8]
	str r0, [sp, #0xc]
_0208DA38:
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	add r0, sp, #0x8a
	add r4, sp, #0
	mov r5, #0
	bl sub_0208D4B8
	add r0, sp, #0x8a
	add r1, sp, #0xd6
	bl sub_0208D054
	cmp r0, #0
	bne _0208DCAC
	add r0, sp, #0x8a
	add r1, sp, #0xd6
	bl sub_0208D134
	cmp r0, #0
	movne r5, #1
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r5, #0
	moveq r6, #1
	str r1, [sp]
	str r0, [sp, #4]
	movne r6, #0
_0208DA94:
	cmp r6, #0
	bne _0208DABC
	ldmia r4, {r0, r1}
	adds r0, r0, #1
	adc r1, r1, #0
	stmia r4, {r0, r1}
	bl sub_0208DDAC
	cmp r0, #2
	beq _0208DCAC
	b _0208DAD4
_0208DABC:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	subs r1, r1, #1
	sbc r0, r0, #0
	str r1, [r4]
	str r0, [r4, #4]
_0208DAD4:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, sp, #0x64
	bl sub_0208D4B8
	cmp r5, #0
	beq _0208DB00
	add r0, sp, #0x64
	add r1, sp, #0xd6
	bl sub_0208D134
	cmp r0, #0
	beq _0208DC24
_0208DB00:
	cmp r5, #0
	bne _0208DBDC
	add r0, sp, #0xd6
	add r1, sp, #0x64
	bl sub_0208D134
	cmp r0, #0
	bne _0208DBDC
	add r3, sp, #0x8a
	add r5, sp, #0x3e
	mov r2, #9
_0208DB28:
	ldrh r1, [r3]
	ldrh r0, [r3, #2]
	add r3, r3, #4
	strh r1, [r5]
	strh r0, [r5, #2]
	add r5, r5, #4
	subs r2, r2, #1
	bne _0208DB28
	ldrh r0, [r3]
	add r3, sp, #0x64
	add r4, sp, #0x8a
	strh r0, [r5]
	mov r2, #9
_0208DB5C:
	ldrh r1, [r3]
	ldrh r0, [r3, #2]
	add r3, r3, #4
	strh r1, [r4]
	strh r0, [r4, #2]
	add r4, r4, #4
	subs r2, r2, #1
	bne _0208DB5C
	ldrh r0, [r3]
	add r3, sp, #0x3e
	add r5, sp, #0x64
	strh r0, [r4]
	mov r2, #9
_0208DB90:
	ldrh r1, [r3]
	ldrh r0, [r3, #2]
	add r3, r3, #4
	strh r1, [r5]
	strh r0, [r5, #2]
	add r5, r5, #4
	subs r2, r2, #1
	bne _0208DB90
	ldrh r4, [r3]
	ldr r3, [sp, #8]
	ldr r1, [sp]
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #4]
	strh r4, [r5]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r3, [sp]
	str r2, [sp, #4]
	b _0208DC24
_0208DBDC:
	add r7, sp, #0x64
	add r3, sp, #0x8a
	mov r2, #9
_0208DBE8:
	ldrh r1, [r7]
	ldrh r0, [r7, #2]
	add r7, r7, #4
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	subs r2, r2, #1
	bne _0208DBE8
	ldrh r2, [r7]
	ldr r1, [sp]
	ldr r0, [sp, #4]
	strh r2, [r3]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	b _0208DA94
_0208DC24:
	add r0, sp, #0x3e
	add r1, sp, #0xd6
	add r2, sp, #0x8a
	bl sub_0208D214
	add r0, sp, #0x18
	add r1, sp, #0x64
	add r2, sp, #0xd6
	bl sub_0208D214
	add r0, sp, #0x3e
	add r1, sp, #0x18
	bl sub_0208D054
	cmp r0, #0
	beq _0208DC88
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	and r1, r1, #1
	and r0, r0, #0
	cmp r0, #0
	cmpeq r1, #0
	beq _0208DCAC
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	b _0208DCAC
_0208DC88:
	add r0, sp, #0x3e
	add r1, sp, #0x18
	bl sub_0208D134
	cmp r0, #0
	bne _0208DCAC
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
_0208DCAC:
	ldrsb r0, [sp, #0xd6]
	cmp r0, #0
	beq _0208DCD4
	mov r0, #0
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r1, r0
	bl _dsub
	str r0, [sp, #8]
	str r1, [sp, #0xc]
_0208DCD4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0208DCE4: .word 0x3FF00000
_0208DCE8: .word 0xBFF00000
_0208DCEC: .word _020B2FB8
_0208DCF0: .word 0x7FF00000
_0208DCF4: .word _020B333C
_0208DCF8: .word _020B3228
_0208DCFC: .word 0x40140000
_0208DD00: .word 0x7FEFFFFF
	arm_func_end sub_0208D6E0

	arm_func_start sub_0208DD04
sub_0208DD04: ; 0x0208DD04
	mov r3, r0, lsr #1
	ldr r2, _0208DD8C ; =0x55555555
	orr r3, r3, r1, lsl #31
	and r3, r3, r2
	subs ip, r0, r3
	and r2, r2, r1, lsr #1
	ldr r0, _0208DD90 ; =0x33333333
	sbc r3, r1, r2
	mov r1, ip, lsr #2
	orr r1, r1, r3, lsl #30
	and r2, ip, r0
	and r1, r1, r0
	adds r2, r2, r1
	and r1, r3, r0
	and r0, r0, r3, lsr #2
	adc r1, r1, r0
	mov r0, r2, lsr #4
	orr r0, r0, r1, lsl #28
	adds r2, r2, r0
	ldr r0, _0208DD94 ; =0x0F0F0F0F
	adc r1, r1, r1, lsr #4
	and r3, r2, r0
	and r2, r1, r0
	mov r0, r3, lsr #8
	orr r0, r0, r2, lsl #24
	adds r1, r3, r0
	adc r2, r2, r2, lsr #8
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	adds r1, r1, r0
	adc r0, r2, r2, lsr #16
	adds r0, r1, r0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0208DD8C: .word 0x55555555
_0208DD90: .word 0x33333333
_0208DD94: .word 0x0F0F0F0F
	arm_func_end sub_0208DD04

	arm_func_start sub_0208DD98
sub_0208DD98: ; 0x0208DD98
	stmdb sp!, {r0, r1, r2, r3}
	ldr r0, [sp, #4]
	and r0, r0, #0x80000000
	add sp, sp, #0x10
	bx lr
	arm_func_end sub_0208DD98

	arm_func_start sub_0208DDAC
sub_0208DDAC: ; 0x0208DDAC
	stmdb sp!, {r0, r1, r2, r3}
	ldr r2, [sp, #4]
	ldr r0, _0208DE14 ; =0x7FF00000
	ands r1, r2, r0
	beq _0208DDE8
	cmp r1, r0
	bne _0208DE08
	ldr r0, _0208DE18 ; =0x000FFFFF
	tst r2, r0
	ldreq r0, [sp]
	add sp, sp, #0x10
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #2
	bx lr
_0208DDE8:
	ldr r0, _0208DE18 ; =0x000FFFFF
	tst r2, r0
	ldreq r0, [sp]
	add sp, sp, #0x10
	cmpeq r0, #0
	movne r0, #5
	moveq r0, #3
	bx lr
_0208DE08:
	mov r0, #4
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_0208DE14: .word 0x7FF00000
_0208DE18: .word 0x000FFFFF
	arm_func_end sub_0208DDAC

	arm_func_start sub_0208DE1C
sub_0208DE1C: ; 0x0208DE1C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r2
	add r2, sp, #0
	bl sub_0208C5D4
	ldr r2, [sp]
	add r2, r2, r4
	str r2, [sp]
	bl sub_0208C690
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0208DE1C

	arm_func_start sub_0208DE48
sub_0208DE48: ; 0x0208DE48
	stmdb sp!, {r3, lr}
	ldr r3, _0208DEAC ; =_020AECB0
_0208DE50:
	ldrb r2, [r0], #1
	cmp r2, #0
	blt _0208DE68
	cmp r2, #0x80
	bge _0208DE68
	ldrb r2, [r3, r2]
_0208DE68:
	ldrb lr, [r1], #1
	and ip, r2, #0xff
	cmp lr, #0
	blt _0208DE84
	cmp lr, #0x80
	bge _0208DE84
	ldrb lr, [r3, lr]
_0208DE84:
	and r2, lr, #0xff
	cmp ip, r2
	mvnlo r0, #0
	ldmloia sp!, {r3, pc}
	movhi r0, #1
	ldmhiia sp!, {r3, pc}
	cmp ip, #0
	bne _0208DE50
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0208DEAC: .word _020AECB0
	arm_func_end sub_0208DE48

	arm_func_start sub_0208DEB0
sub_0208DEB0: ; 0x0208DEB0
	ldr ip, _0208DEB8 ; =sub_02086C64
	bx ip
	.align 2, 0
_0208DEB8: .word sub_02086C64
	arm_func_end sub_0208DEB0

	arm_func_start sub_0208DEBC
sub_0208DEBC: ; 0x0208DEBC
	ldr ip, _0208DEC4 ; =sub_0208DE48
	bx ip
	.align 2, 0
_0208DEC4: .word sub_0208DE48
	arm_func_end sub_0208DEBC

	; FP_fastI_v5t_LE.a

	; Other names: _d_add
	arm_func_start _dadd
_dadd: ; 0x0208DEC8
	stmdb sp!, {r4, lr}
	eors ip, r1, r3
	eormi r3, r3, #0x80000000
	bmi _0208E914
__dadd_start:
	subs ip, r0, r2
	sbcs lr, r1, r3
	bhs _0208DEF4
	adds r2, r2, ip
	adc r3, r3, lr
	subs r0, r0, ip
	sbc r1, r1, lr
_0208DEF4:
	mov lr, #0x80000000
	mov ip, r1, lsr #0x14
	orr r1, lr, r1, lsl #11
	orr r1, r1, r0, lsr #21
	mov r0, r0, lsl #0xb
	movs r4, ip, lsl #0x15
	cmnne r4, #0x200000
	beq _0208DFF0
	mov r4, r3, lsr #0x14
	orr r3, lr, r3, lsl #11
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs lr, r4, lsl #0x15
	beq _0208E038
_0208DF2C:
	subs r4, ip, r4
	beq _0208DF84
	cmp r4, #0x20
	ble _0208DF68
	cmp r4, #0x38
	movge r4, #0x3f
	sub r4, r4, #0x20
	rsb lr, r4, #0x20
	orrs lr, r2, r3, lsl lr
	mov r2, r3, lsr r4
	orrne r2, r2, #1
	adds r0, r0, r2
	adcs r1, r1, #0
	blo _0208DFAC
	b _0208DF90
_0208DF68:
	rsb lr, r4, #0x20
	movs lr, r2, lsl lr
	rsb lr, r4, #0x20
	mov r2, r2, lsr r4
	orr r2, r2, r3, lsl lr
	mov r3, r3, lsr r4
	orrne r2, r2, #1
_0208DF84:
	adds r0, r0, r2
	adcs r1, r1, r3
	blo _0208DFAC
_0208DF90:
	add ip, ip, #1
	and r4, r0, #1
	movs r1, r1, rrx
	orr r0, r4, r0, rrx
	mov lr, ip, lsl #0x15
	cmn lr, #0x200000
	beq _0208E1BC
_0208DFAC:
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	mov r1, r1, lsr #0xc
	orr r1, r1, ip, lsl #20
	tst r2, #0x80000000
	ldmeqia sp!, {r4, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, lr}
	bx lr
_0208DFF0:
	cmp ip, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bics ip, ip, #0x800
	beq _0208E05C
	orrs r4, r0, r1, lsl #1
	bne _0208E198
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	beq _0208E184
	cmn r4, #0x200000
	bne _0208E184
	orrs r4, r2, r3, lsl #1
	beq _0208E184
	b _0208E198
_0208E038:
	cmp r4, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bic ip, ip, #0x800
	bics r4, r4, #0x800
	beq _0208E0C8
	orrs r4, r2, r3, lsl #1
	bne _0208E198
	b _0208E184
_0208E05C:
	orrs r4, r0, r1, lsl #1
	beq _0208E09C
	mov ip, #1
	bic r1, r1, #0x80000000
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	cmnne r4, #0x200000
	mov r4, r4, lsr #0x15
	orr r4, r4, lr, lsr #20
	beq _0208E038
	orr r3, r3, #0x80000000
	orr ip, ip, lr, lsr #20
	b _0208DF2C
_0208E09C:
	mov ip, r3, lsr #0x14
	mov r1, r3, lsl #0xb
	orr r1, r1, r2, lsr #21
	mov r0, r2, lsl #0xb
	movs r4, ip, lsl #0x15
	beq _0208E150
	cmn r4, #0x200000
	bne _0208E150
	orrs r4, r0, r1, lsl #1
	beq _0208E184
	b _0208E19C
_0208E0C8:
	orrs r4, r2, r3, lsl #1
	beq _0208E160
	mov r4, #1
	bic r3, r3, #0x80000000
	cmp r1, #0
	bpl _0208E0EC
	orr ip, ip, lr, lsr #20
	orr r4, r4, lr, lsr #20
	b _0208DF2C
_0208E0EC:
	adds r0, r0, r2
	adcs r1, r1, r3
	blo _0208E10C
	add ip, ip, #1
	and r4, r0, #1
	movs r1, r1, rrx
	mov r0, r0, rrx
	orr r0, r0, r4
_0208E10C:
	cmp r1, #0
	subges ip, ip, #1
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmeqia sp!, {r4, lr}
	bxeq lr
	tst r2, #0x80000000
	ldmeqia sp!, {r4, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
_0208E150:
	mov r1, r3
	mov r0, r2
	ldmia sp!, {r4, lr}
	bx lr
_0208E160:
	cmp r1, #0
	subges ip, ip, #1
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmia sp!, {r4, lr}
	bx lr
_0208E184:
	ldr r1, _0208E1DC ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
_0208E198:
	mov r1, r3
_0208E19C:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_0208E1AC:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_0208E1BC:
	cmp ip, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	ldr r1, _0208E1DC ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0208E1DC: .word 0x7FF00000
	arm_func_end _dadd

	; Other names: _d_dtof, _f_qtof
	arm_func_start _d2f
_d2f: ; 0x0208E1E0
	and r2, r1, #0x80000000
	mov ip, r1, lsr #0x14
	bics ip, ip, #0x800
	beq _0208E258
	mov r3, ip, lsl #0x15
	cmn r3, #0x200000
	bhs _0208E23C
	subs ip, ip, #0x380
	bls _0208E268
	cmp ip, #0xff
	bge _0208E2D8
	mov r1, r1, lsl #0xc
	orr r3, r2, r1, lsr #9
	orr r3, r3, r0, lsr #29
	movs r1, r0, lsl #3
	orr r0, r3, ip, lsl #23
	bxeq lr
	tst r1, #0x80000000
	bxeq lr
	movs r1, r1, lsl #1
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_0208E23C:
	orrs r3, r0, r1, lsl #12
	bne _0208E250
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_0208E250:
	mvn r0, #0x80000000
	bx lr
_0208E258:
	orrs r3, r0, r1, lsl #12
	bne __f_underflow
__f_result_zero:
	mov r0, r2
	bx lr
_0208E268:
	cmn ip, #0x17
	beq _0208E2BC
	bmi __f_underflow
	mov r1, r1, lsl #0xb
	orr r1, r1, #0x80000000
	mov r3, r1, lsr #8
	orr r3, r3, r0, lsr #29
	rsb ip, ip, #1
	movs r1, r0, lsl #3
	orr r0, r2, r3, lsr ip
	rsb ip, ip, #0x20
	mov r3, r3, lsl ip
	orrne r3, r3, #1
	movs r1, r3
	bxeq lr
	tst r1, #0x80000000
	bxeq lr
	movs r1, r1, lsl #1
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_0208E2BC:
	orr r0, r0, r1, lsl #12
__f_very_tiny_result:
	movs r1, r0
	mov r0, r2
	addne r0, r0, #1
	bx lr
__f_underflow:
	mov r0, r2
	bx lr
_0208E2D8:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
	arm_func_end _d2f

	; Other names: _d_dtoull
	arm_func_start _ll_ufrom_d
_ll_ufrom_d: ; 0x0208E2E4
	tst r1, #0x80000000
	bne _0208E348
	ldr r2, _0208E36C ; =0x0000043E
	subs r2, r2, r1, lsr #20
	blt _0208E360
	cmp r2, #0x40
	bge _0208E33C
	mov ip, r1, lsl #0xb
	orr ip, ip, #0x80000000
	orr ip, ip, r0, lsr #21
	cmp r2, #0x20
	ble _0208E324
	sub r2, r2, #0x20
	mov r1, #0
	mov r0, ip, lsr r2
	bx lr
_0208E324:
	mov r3, r0, lsl #0xb
	mov r1, ip, lsr r2
	mov r0, r3, lsr r2
	rsb r2, r2, #0x20
	orr r0, r0, ip, lsl r2
	bx lr
_0208E33C:
	mov r1, #0
	mov r0, #0
	bx lr
_0208E348:
	cmn r1, #0x100000
	cmpeq r0, #0
	bhi _0208E360
	mov r1, #0
	mov r0, #0
	bx lr
_0208E360:
	mvn r1, #0
	mvn r0, #0
	bx lr
	.align 2, 0
_0208E36C: .word 0x0000043E
	arm_func_end _ll_ufrom_d

	; Other names: _d_itod
	arm_func_start _dflt
_dflt: ; 0x0208E370
	ands r2, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r0, #0
__d_itod_common:
	mov r1, #0
	bxeq lr
	mov r3, #0x400
	add r3, r3, #0x1e
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
	movs r1, r0
	mov r0, r1, lsl #0x15
	add r1, r1, r1
	orr r1, r2, r1, lsr #12
	orr r1, r1, r3, lsl #20
	bx lr
	arm_func_end _dflt

	; Other names: _d_utod
	arm_func_start _dfltu
_dfltu: ; 0x0208E3B0
	cmp r0, #0
	mov r1, #0
	bxeq lr
	mov r3, #0x400
	add r3, r3, #0x1e
	bmi _0208E3D4
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
_0208E3D4:
	mov r1, r0
	mov r0, r1, lsl #0x15
	add r1, r1, r1
	mov r1, r1, lsr #0xc
	orr r1, r1, r3, lsl #20
	bx lr
	arm_func_end _dfltu

	; Other names: _d_mul
	arm_func_start _dmul
_dmul: ; 0x0208E3EC
	stmdb sp!, {r4, r5, r6, r7, lr}
	eor lr, r1, r3
	and lr, lr, #0x80000000
	mov ip, r1, lsr #0x14
	mov r1, r1, lsl #0xb
	orr r1, r1, r0, lsr #21
	mov r0, r0, lsl #0xb
	movs r6, ip, lsl #0x15
	cmnne r6, #0x200000
	beq _0208E4F4
	orr r1, r1, #0x80000000
	bic ip, ip, #0x800
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	cmnne r5, #0x200000
	beq _0208E53C
	orr r3, r3, #0x80000000
	bic r4, r4, #0x800
_0208E440:
	add ip, r4, ip
	umull r5, r4, r0, r2
	umull r7, r6, r0, r3
	adds r4, r7, r4
	adc r6, r6, #0
	umull r7, r0, r1, r2
	adds r4, r7, r4
	adcs r0, r0, r6
	umull r7, r2, r1, r3
	adc r1, r2, #0
	adds r0, r0, r7
	adc r1, r1, #0
	orrs r4, r4, r5
	orrne r0, r0, #1
	cmp r1, #0
	blt _0208E48C
	sub ip, ip, #1
	adds r0, r0, r0
	adc r1, r1, r1
_0208E48C:
	add ip, ip, #2
	subs ip, ip, #0x400
	bmi _0208E628
	beq _0208E628
	mov r6, ip, lsl #0x14
	cmn r6, #0x100000
	bmi _0208E728
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	tst r2, #0x80000000
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_0208E4F4:
	bics ip, ip, #0x800
	beq _0208E550
	orrs r6, r0, r1, lsl #1
	bne _0208E6DC
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	beq _0208E530
	cmn r5, #0x200000
	bne _0208E6C8
	orrs r5, r2, r3, lsl #1
	beq _0208E6C8
	b _0208E6DC
_0208E530:
	orrs r5, r3, r2
	beq _0208E6F0
	b _0208E6C8
_0208E53C:
	bics r4, r4, #0x800
	beq _0208E5E4
	orrs r6, r2, r3, lsl #1
	bne _0208E6DC
	b _0208E6C8
_0208E550:
	orrs r6, r0, r1, lsl #1
	beq _0208E5B8
	mov ip, #1
	cmp r1, #0
	bne _0208E574
	sub ip, ip, #0x20
	movs r1, r0
	mov r0, #0
	bmi _0208E590
_0208E574:
	clz r6, r1
	movs r1, r1, lsl r6
	rsb r6, r6, #0x20
	orr r1, r1, r0, lsr r6
	rsb r6, r6, #0x20
	mov r0, r0, lsl r6
	sub ip, ip, r6
_0208E590:
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	cmnne r5, #0x200000
	beq _0208E53C
	orr r3, r3, #0x80000000
	bic r4, r4, #0x800
	b _0208E440
_0208E5B8:
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	beq _0208E73C
	cmn r5, #0x200000
	bne _0208E73C
	orrs r6, r2, r3, lsl #1
	beq _0208E6F0
	b _0208E6DC
_0208E5E4:
	orrs r5, r2, r3, lsl #1
	beq _0208E73C
	mov r4, #1
	cmp r3, #0
	bne _0208E608
	sub r4, r4, #0x20
	movs r3, r2
	mov r2, #0
	bmi _0208E440
_0208E608:
	clz r6, r3
	movs r3, r3, lsl r6
	rsb r6, r6, #0x20
	orr r3, r3, r2, lsr r6
	rsb r6, r6, #0x20
	mov r2, r2, lsl r6
	sub r4, r4, r6
	b _0208E440
_0208E628:
	cmn ip, #0x34
	beq _0208E6C0
	bmi _0208E718
	mov r2, r1
	mov r3, r0
	add r4, ip, #0x34
	cmp r4, #0x20
	movge r2, r3
	movge r3, #0
	subge r4, r4, #0x20
	rsb r5, r4, #0x20
	mov r2, r2, lsl r4
	orr r2, r2, r3, lsr r5
	movs r3, r3, lsl r4
	orrne r2, r2, #1
	rsb ip, ip, #0xc
	cmp ip, #0x20
	movge r0, r1
	movge r1, #0
	subge ip, ip, #0x20
	rsb r4, ip, #0x20
	mov r0, r0, lsr ip
	orr r0, r0, r1, lsl r4
	orr r1, lr, r1, lsr ip
	cmp r2, #0
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	tst r2, #0x80000000
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_0208E6C0:
	orr r0, r0, r1, lsl #1
	b _0208E700
_0208E6C8:
	ldr r1, _0208E74C ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_0208E6DC:
	mov r1, r3
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_0208E6F0:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_0208E700:
	movs r2, r0
	mov r1, lr
	mov r0, #0
	addne r0, r0, #1
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_0208E718:
	mov r1, lr
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_0208E728:
	ldr r1, _0208E74C ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_0208E73C:
	mov r1, lr
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0208E74C: .word 0x7FF00000
	arm_func_end _dmul

	arm_func_start _dsqrt
_dsqrt: ; 0x0208E750
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0208E8E0 ; =0x7FF00000
	cmp r1, r2
	bhs _0208E89C
	movs ip, r1, lsr #0x14
	beq _0208E848
	bic r1, r1, r2
	orr r1, r1, #0x100000
_0208E770:
	movs ip, ip, asr #1
	bhs _0208E784
	sub ip, ip, #1
	movs r0, r0, lsl #1
	adc r1, r1, r1
_0208E784:
	movs r3, r0, lsl #1
	adc r1, r1, r1
	mov r2, #0
	mov r4, #0
	mov lr, #0x200000
_0208E798:
	add r6, r4, lr
	cmp r6, r1
	addle r4, r6, lr
	suble r1, r1, r6
	addle r2, r2, lr
	movs r3, r3, lsl #1
	adc r1, r1, r1
	movs lr, lr, lsr #1
	bne _0208E798
	mov r0, #0
	mov r5, #0
	cmp r1, r4
	cmpeq r3, #0x80000000
	blo _0208E7E0
	subs r3, r3, #0x80000000
	sbc r1, r1, r4
	add r4, r4, #1
	mov r0, #0x80000000
_0208E7E0:
	movs r3, r3, lsl #1
	adc r1, r1, r1
	mov lr, #0x40000000
_0208E7EC:
	add r6, r5, lr
	cmp r4, r1
	cmpeq r6, r3
	bhi _0208E80C
	add r5, r6, lr
	subs r3, r3, r6
	sbc r1, r1, r4
	add r0, r0, lr
_0208E80C:
	movs r3, r3, lsl #1
	adc r1, r1, r1
	movs lr, lr, lsr #1
	bne _0208E7EC
	orrs r1, r1, r3
	biceq r0, r0, #1
	movs r1, r2, lsr #1
	movs r0, r0, rrx
	adcs r0, r0, #0
	adc r1, r1, #0
	add r1, r1, #0x20000000
	sub r1, r1, #0x100000
	add r1, r1, ip, lsl #20
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_0208E848:
	cmp r1, #0
	bne _0208E878
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	mvn ip, #0x13
	clz r5, r0
	movs r0, r0, lsl r5
	sub ip, ip, r5
	mov r1, r0, lsr #0xb
	mov r0, r0, lsl #0x15
	b _0208E770
_0208E878:
	clz r2, r1
	movs r1, r1, lsl r2
	rsb r2, r2, #0x2b
	mov r1, r1, lsr #0xb
	orr r1, r1, r0, lsr r2
	rsb r2, r2, #0x20
	mov r0, r0, lsl r2
	rsb ip, r2, #1
	b _0208E770
_0208E89C:
	tst r1, #0x80000000
	beq _0208E8B8
	bics r3, r1, #0x80000000
	cmpeq r0, #0
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	b _0208E8C4
_0208E8B8:
	orrs r2, r0, r1, lsl #12
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
_0208E8C4:
	ldr r2, _0208E8E4 ; =0x7FF80000
	orr r1, r1, r2
	ldr r3, _0208E8E8 ; =_022BCA70
	mov r4, #0x21
	str r4, [r3]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0208E8E0: .word 0x7FF00000
_0208E8E4: .word 0x7FF80000
_0208E8E8: .word _022BCA70
	arm_func_end _dsqrt
_0208E8EC:
	.byte 0x03, 0x10, 0x21, 0xE0
	.byte 0x03, 0x30, 0x21, 0xE0, 0x03, 0x10, 0x21, 0xE0, 0x02, 0x00, 0x20, 0xE0, 0x02, 0x20, 0x20, 0xE0
	.byte 0x02, 0x00, 0x20, 0xE0

	; Other names: _d_sub
	arm_func_start _dsub
_dsub: ; 0x0208E904
	stmdb sp!, {r4, lr}
	eors ip, r1, r3
	eormi r3, r3, #0x80000000
	bmi __dadd_start
_0208E914:
	subs ip, r0, r2
	sbcs lr, r1, r3
	bhs _0208E934
	eor lr, lr, #0x80000000
	adds r2, r2, ip
	adc r3, r3, lr
	subs r0, r0, ip
	sbc r1, r1, lr
_0208E934:
	mov lr, #0x80000000
	mov ip, r1, lsr #0x14
	orr r1, lr, r1, lsl #11
	orr r1, r1, r0, lsr #21
	mov r0, r0, lsl #0xb
	movs r4, ip, lsl #0x15
	cmnne r4, #0x200000
	beq _0208EB38
	mov r4, r3, lsr #0x14
	orr r3, lr, r3, lsl #11
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs lr, r4, lsl #0x15
	beq _0208EB80
_0208E96C:
	subs r4, ip, r4
	beq _0208EA14
	cmp r4, #0x20
	ble _0208E9A8
	cmp r4, #0x38
	movge r4, #0x3f
	sub r4, r4, #0x20
	rsb lr, r4, #0x20
	orrs lr, r2, r3, lsl lr
	mov r2, r3, lsr r4
	orrne r2, r2, #1
	subs r0, r0, r2
	sbcs r1, r1, #0
	bmi _0208E9D0
	b _0208EAC0
_0208E9A8:
	rsb lr, r4, #0x20
	movs lr, r2, lsl lr
	rsb lr, r4, #0x20
	mov r2, r2, lsr r4
	orr r2, r2, r3, lsl lr
	mov r3, r3, lsr r4
	orrne r2, r2, #1
	subs r0, r0, r2
	sbcs r1, r1, r3
	bpl _0208EAC0
_0208E9D0:
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	mov r1, r1, lsr #0xc
	orr r1, r1, ip, lsl #20
	tst r2, #0x80000000
	ldmeqia sp!, {r4, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, lr}
	bx lr
_0208EA14:
	subs r0, r0, r2
	sbc r1, r1, r3
	orrs lr, r1, r0
	beq _0208ECA4
	mov lr, ip, lsl #0x14
	and lr, lr, #0x80000000
	bic ip, ip, #0x800
	cmp r1, #0
	bmi _0208EA9C
	bne _0208EA4C
	sub ip, ip, #0x20
	movs r1, r0
	mov r0, #0
	bmi _0208EA68
_0208EA4C:
	clz r4, r1
	movs r1, r1, lsl r4
	rsb r4, r4, #0x20
	orr r1, r1, r0, lsr r4
	rsb r4, r4, #0x20
	mov r0, r0, lsl r4
	sub ip, ip, r4
_0208EA68:
	cmp ip, #0
	bgt _0208EAA4
	rsb ip, ip, #0xc
	cmp ip, #0x20
	movge r0, r1
	movge r1, #0
	subge ip, ip, #0x20
	rsb r4, ip, #0x20
	mov r0, r0, lsr ip
	orr r0, r0, r1, lsl r4
	orr r1, lr, r1, lsr ip
	ldmia sp!, {r4, lr}
	bx lr
_0208EA9C:
	cmp r1, #0
	subges ip, ip, #1
_0208EAA4:
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmia sp!, {r4, lr}
	bx lr
_0208EAC0:
	mov lr, ip, lsl #0x14
	and lr, lr, #0x80000000
	bic ip, ip, #0x800
	cmp r1, #0
	bne _0208EAE4
	sub ip, ip, #0x20
	movs r1, r0
	mov r0, #0
	bmi _0208EB00
_0208EAE4:
	clz r4, r1
	movs r1, r1, lsl r4
	rsb r4, r4, #0x20
	orr r1, r1, r0, lsr r4
	rsb r4, r4, #0x20
	mov r0, r0, lsl r4
	sub ip, ip, r4
_0208EB00:
	cmp ip, #0
	orrgt ip, ip, lr, lsr #20
	bgt _0208E9D0
	rsb ip, ip, #0xc
	cmp ip, #0x20
	movge r0, r1
	movge r1, #0
	subge ip, ip, #0x20
	rsb r4, ip, #0x20
	mov r0, r0, lsr ip
	orr r0, r0, r1, lsl r4
	orr r1, lr, r1, lsr ip
	ldmia sp!, {r4, lr}
	bx lr
_0208EB38:
	cmp ip, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bics ip, ip, #0x800
	beq _0208EBA4
	orrs r4, r0, r1, lsl #1
	bne _0208EC80
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	beq _0208EC6C
	cmn r4, #0x200000
	bne _0208EC6C
	orrs r4, r2, r3, lsl #1
	beq _0208EC94
	b _0208EC80
_0208EB80:
	cmp r4, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bic ip, ip, #0x800
	bics r4, r4, #0x800
	beq _0208EC1C
	orrs r4, r2, r3, lsl #1
	bne _0208EC80
	b _0208EC6C
_0208EBA4:
	orrs r4, r0, r1, lsl #1
	beq _0208EBE4
	mov ip, #1
	bic r1, r1, #0x80000000
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	cmnne r4, #0x200000
	mov r4, r4, lsr #0x15
	orr r4, r4, lr, lsr #20
	beq _0208EB80
	orr r3, r3, #0x80000000
	orr ip, ip, lr, lsr #20
	b _0208E96C
_0208EBE4:
	mov ip, r3, lsr #0x14
	mov r1, r3, lsl #0xb
	orr r1, r1, r2, lsr #21
	mov r0, r2, lsl #0xb
	movs r4, ip, lsl #0x15
	beq _0208EC10
	cmn r4, #0x200000
	bne _0208EC38
	orrs r4, r0, r1, lsl #1
	bne _0208EC84
	b _0208EC6C
_0208EC10:
	orrs r4, r0, r1, lsl #1
	beq _0208ECA4
	b _0208EC38
_0208EC1C:
	orrs r4, r2, r3, lsl #1
	beq _0208EC48
	mov r4, #1
	bic r3, r3, #0x80000000
	orr ip, ip, lr, lsr #20
	orr r4, r4, lr, lsr #20
	b _0208E96C
_0208EC38:
	mov r1, r3
	mov r0, r2
	ldmia sp!, {r4, lr}
	bx lr
_0208EC48:
	cmp r1, #0
	subges ip, ip, #1
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmia sp!, {r4, lr}
	bx lr
_0208EC6C:
	ldr r1, _0208ECB4 ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
_0208EC80:
	mov r1, r3
_0208EC84:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_0208EC94:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_0208ECA4:
	mov r1, #0
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0208ECB4: .word 0x7FF00000
	arm_func_end _dsub

	; Other names: _f_add
	arm_func_start _fadd
_fadd: ; 0x0208ECB8
	eors r2, r0, r1
	eormi r1, r1, #0x80000000
	bmi __fsub_start
__fadd_start:
	subs ip, r0, r1
	sublo r0, r0, ip
	addlo r1, r1, ip
	mov r2, #0x80000000
	mov r3, r0, lsr #0x17
	orr r0, r2, r0, lsl #8
	ands ip, r3, #0xff
	cmpne ip, #0xff
	beq _0208ED58
	mov ip, r1, lsr #0x17
	orr r1, r2, r1, lsl #8
	ands r2, ip, #0xff
	beq _0208ED98
_0208ECF8:
	subs ip, r3, ip
	beq _0208ED10
	rsb r2, ip, #0x20
	movs r2, r1, lsl r2
	mov r1, r1, lsr ip
	orrne r1, r1, #1
_0208ED10:
	adds r0, r0, r1
	blo _0208ED30
	and r1, r0, #1
	orr r0, r1, r0, rrx
	add r3, r3, #1
	and r2, r3, #0xff
	cmp r2, #0xff
	beq _0208EEA0
_0208ED30:
	ands r1, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_0208ED58:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	ands r3, r3, #0xff
	beq _0208EDBC
	movs r0, r0, lsl #1
	bne _0208EECC
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _0208EEC0
	cmp ip, #0xff
	blt _0208EEC0
	cmp r1, #0
	beq _0208EEC0
	b _0208EECC
_0208ED98:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	and r3, r3, #0xff
	ands ip, ip, #0xff
	beq _0208EE18
_0208EDB0:
	movs r1, r1, lsl #1
	bne _0208EECC
	b _0208EEC0
_0208EDBC:
	movs r0, r0, lsl #1
	beq _0208EDF4
	mov r3, #1
	mov r0, r0, lsr #1
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #8
	ands ip, ip, #0xff
	beq _0208EE18
	cmp ip, #0xff
	beq _0208EDB0
	orr r1, r1, #0x80000000
	orr r3, r3, r2, lsr #23
	orr ip, ip, r2, lsr #23
	b _0208ECF8
_0208EDF4:
	mov r3, r1, lsr #0x17
	mov r0, r1, lsl #9
	ands r3, r3, #0xff
	beq _0208EE80
	cmp r3, #0xff
	blt _0208EE80
	cmp r0, #0
	beq _0208EEC0
	b _0208EEB8
_0208EE18:
	movs r1, r1, lsl #1
	beq _0208EE88
	mov r1, r1, lsr #1
	mov ip, #1
	orr r3, r3, r2, lsr #23
	orr ip, ip, r2, lsr #23
	cmp r0, #0
	bmi _0208ECF8
	adds r0, r0, r1
	blo _0208EE4C
	and r1, r0, #1
	orr r0, r1, r0, rrx
	add ip, ip, #1
_0208EE4C:
	cmp r0, #0
	subge ip, ip, #1
	ands r1, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, ip, lsl #23
	bxeq lr
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_0208EE80:
	mov r0, r1
	bx lr
_0208EE88:
	cmp r0, #0
	subges r3, r3, #1
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_0208EEA0:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_0208EEB8:
	mvn r0, #0x80000000
	bx lr
_0208EEC0:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_0208EECC:
	mvn r0, #0x80000000
	bx lr
	arm_func_end _fadd

	arm_func_start sub_0208EED4
sub_0208EED4: ; 0x0208EED4
	mvn r0, #0x80000000
	bx lr
	arm_func_end sub_0208EED4

	; Other names: _d_fgt
	arm_func_start _dgr
_dgr: ; 0x0208EEDC
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _0208EF50
	cmn ip, r3, lsl #1
	bhs _0208EF64
_0208EEF0:
	orrs ip, r3, r1
	bmi _0208EF20
	cmp r1, r3
	cmpeq r0, r2
	movhi r0, #1
	movls r0, #0
	bx lr
_0208EF0C:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_0208EF20:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	msr cpsr_f, ip
	bxeq lr
	cmp r3, r1
	cmpeq r2, r0
	movhi r0, #1
	movls r0, #0
	bx lr
_0208EF50:
	bne _0208EF0C
	cmp r0, #0
	bhi _0208EF0C
	cmn ip, r3, lsl #1
	blo _0208EEF0
_0208EF64:
	bne _0208EF0C
	cmp r2, #0
	bhi _0208EF0C
	b _0208EEF0
	arm_func_end _dgr

	; Other names: _d_fle
	arm_func_start _dleq
_dleq: ; 0x0208EF74
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _0208EFF4
	cmn ip, r3, lsl #1
	bhs _0208F008
_0208EF88:
	orrs ip, r3, r1
	bmi _0208EFBC
	cmp r1, r3
	cmpeq r0, r2
	movls r0, #1
	movhi r0, #0
	bx lr
_0208EFA4:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_0208EFBC:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #1
	bne _0208EFE0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	orr ip, ip, #0x40000000
	msr cpsr_f, ip
	bxeq lr
_0208EFE0:
	cmp r3, r1
	cmpeq r2, r0
	movls r0, #1
	movhi r0, #0
	bx lr
_0208EFF4:
	bne _0208EFA4
	cmp r0, #0
	bhi _0208EFA4
	cmn ip, r3, lsl #1
	blo _0208EF88
_0208F008:
	bne _0208EFA4
	cmp r2, #0
	bhi _0208EFA4
	b _0208EF88
	arm_func_end _dleq

	; Other names: _d_flt
	arm_func_start _dls
_dls: ; 0x0208F018
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _0208F090
	cmn ip, r3, lsl #1
	bhs _0208F0A4
_0208F02C:
	orrs ip, r3, r1
	bmi _0208F05C
	cmp r1, r3
	cmpeq r0, r2
	movlo r0, #1
	movhs r0, #0
	bx lr
_0208F048:
	mov r0, #0
	mrs ip, cpsr
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_0208F05C:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #0
	bne _0208F07C
	mrs ip, cpsr
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bxeq lr
_0208F07C:
	cmp r3, r1
	cmpeq r2, r0
	movlo r0, #1
	movhs r0, #0
	bx lr
_0208F090:
	bne _0208F048
	cmp r0, #0
	bhi _0208F048
	cmn ip, r3, lsl #1
	blo _0208F02C
_0208F0A4:
	bne _0208F048
	cmp r2, #0
	bhi _0208F048
	b _0208F02C
	arm_func_end _dls

	; Other names: _d_feq
	arm_func_start _deq
_deq: ; 0x0208F0B4
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _0208F11C
	cmn ip, r3, lsl #1
	bhs _0208F130
_0208F0C8:
	orrs ip, r3, r1
	bmi _0208F0F8
	cmp r1, r3
	cmpeq r0, r2
	moveq r0, #1
	movne r0, #0
	bx lr
_0208F0E4:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_0208F0F8:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #1
	bxeq lr
	cmp r3, r1
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
_0208F11C:
	bne _0208F0E4
	cmp r0, #0
	bhi _0208F0E4
	cmn ip, r3, lsl #1
	blo _0208F0C8
_0208F130:
	bne _0208F0E4
	cmp r2, #0
	bhi _0208F0E4
	b _0208F0C8
	arm_func_end _deq

	; Other names: _d_fne
	arm_func_start _dneq
_dneq: ; 0x0208F140
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _0208F1A8
	cmn ip, r3, lsl #1
	bhs _0208F1BC
_0208F154:
	orrs ip, r3, r1
	bmi _0208F184
	cmp r1, r3
	cmpeq r0, r2
	movne r0, #1
	moveq r0, #0
	bx lr
_0208F170:
	mov r0, #1
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_0208F184:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #0
	bxeq lr
	cmp r3, r1
	cmpeq r2, r0
	movne r0, #1
	moveq r0, #0
	bx lr
_0208F1A8:
	bne _0208F170
	cmp r0, #0
	bhi _0208F170
	cmn ip, r3, lsl #1
	blo _0208F154
_0208F1BC:
	bne _0208F170
	cmp r2, #0
	bhi _0208F170
	b _0208F154
	arm_func_end _dneq

	; Other names: _f_flt
	arm_func_start _fls
_fls: ; 0x0208F1CC
	mov r3, #0xff000000
	cmp r3, r0, lsl #1
	cmphs r3, r1, lsl #1
	blo _0208F214
	cmp r0, #0
	bicmi r0, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r1, #0
	bicmi r1, r1, #0x80000000
	rsbmi r1, r1, #0
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
	mrs ip, cpsr
	orrge ip, ip, #0x20000000
	biclt ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_0208F214:
	mov r0, #0
	mrs ip, cpsr
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
	arm_func_end _fls
_0208F228:
	.byte 0x01, 0x00, 0x20, 0xE0, 0x01, 0x10, 0x20, 0xE0
	.byte 0x01, 0x00, 0x20, 0xE0

	; Other names: _f_div
	arm_func_start _fdiv
_fdiv: ; 0x0208F234
	stmdb sp!, {lr}
	mov ip, #0xff
	ands r3, ip, r0, lsr #23
	cmpne r3, #0xff
	beq _0208F408
	ands ip, ip, r1, lsr #23
	cmpne ip, #0xff
	beq _0208F444
	orr r1, r1, #0x800000
	orr r0, r0, #0x800000
	bic r2, r0, #0xff000000
	bic lr, r1, #0xff000000
_0208F264:
	cmp r2, lr
	movlo r2, r2, lsl #1
	sublo r3, r3, #1
	teq r0, r1
	sub r0, pc, #0x94
	ldrb r1, [r0, lr, lsr #15]
	rsb lr, lr, #0
	mov r0, lr, asr #1
	mul r0, r1, r0
	add r0, r0, #0x80000000
	mov r0, r0, lsr #6
	mul r0, r1, r0
	mov r0, r0, lsr #0xe
	mul r1, lr, r0
	sub ip, r3, ip
	mov r1, r1, lsr #0xc
	mul r1, r0, r1
	mov r0, r0, lsl #0xe
	add r0, r0, r1, lsr #15
	umull r1, r0, r2, r0
	mov r3, r0
	orrmi r0, r0, #0x80000000
	adds ip, ip, #0x7e
	bmi _0208F50C
	cmp ip, #0xfe
	bge _0208F5C0
	add r0, r0, ip, lsl #23
	mov ip, r1, lsr #0x1c
	cmp ip, #7
	beq _0208F3E8
	add r0, r0, r1, lsr #31
	ldmia sp!, {lr}
	bx lr
_0208F2E8:
	.byte 0xFF, 0xFF, 0xFE, 0xFD, 0xFC, 0xFB, 0xFA, 0xF9
	.byte 0xF8, 0xF7, 0xF6, 0xF5, 0xF4, 0xF3, 0xF2, 0xF1, 0xF0, 0xF0, 0xEF, 0xEE, 0xED, 0xEC, 0xEB, 0xEA
	.byte 0xEA, 0xE9, 0xE8, 0xE7, 0xE6, 0xE6, 0xE5, 0xE4, 0xE3, 0xE2, 0xE2, 0xE1, 0xE0, 0xDF, 0xDF, 0xDE
	.byte 0xDD, 0xDC, 0xDC, 0xDB, 0xDA, 0xD9, 0xD9, 0xD8, 0xD7, 0xD7, 0xD6, 0xD5, 0xD4, 0xD4, 0xD3, 0xD2
	.byte 0xD2, 0xD1, 0xD0, 0xD0, 0xCF, 0xCE, 0xCE, 0xCD, 0xCC, 0xCC, 0xCB, 0xCB, 0xCA, 0xC9, 0xC9, 0xC8
	.byte 0xC8, 0xC7, 0xC6, 0xC6, 0xC5, 0xC5, 0xC4, 0xC3, 0xC3, 0xC2, 0xC2, 0xC1, 0xC0, 0xC0, 0xBF, 0xBF
	.byte 0xBE, 0xBE, 0xBD, 0xBD, 0xBC, 0xBC, 0xBB, 0xBA, 0xBA, 0xB9, 0xB9, 0xB8, 0xB8, 0xB7, 0xB7, 0xB6
	.byte 0xB6, 0xB5, 0xB5, 0xB4, 0xB4, 0xB3, 0xB3, 0xB2, 0xB2, 0xB1, 0xB1, 0xB0, 0xB0, 0xAF, 0xAF, 0xAF
	.byte 0xAE, 0xAE, 0xAD, 0xAD, 0xAC, 0xAC, 0xAB, 0xAB, 0xAA, 0xAA, 0xAA, 0xA9, 0xA9, 0xA8, 0xA8, 0xA7
	.byte 0xA7, 0xA7, 0xA6, 0xA6, 0xA5, 0xA5, 0xA4, 0xA4, 0xA4, 0xA3, 0xA3, 0xA2, 0xA2, 0xA2, 0xA1, 0xA1
	.byte 0xA0, 0xA0, 0xA0, 0x9F, 0x9F, 0x9E, 0x9E, 0x9E, 0x9D, 0x9D, 0x9D, 0x9C, 0x9C, 0x9B, 0x9B, 0x9B
	.byte 0x9A, 0x9A, 0x9A, 0x99, 0x99, 0x99, 0x98, 0x98, 0x98, 0x97, 0x97, 0x96, 0x96, 0x96, 0x95, 0x95
	.byte 0x95, 0x94, 0x94, 0x94, 0x93, 0x93, 0x93, 0x92, 0x92, 0x92, 0x91, 0x91, 0x91, 0x91, 0x90, 0x90
	.byte 0x90, 0x8F, 0x8F, 0x8F, 0x8E, 0x8E, 0x8E, 0x8D, 0x8D, 0x8D, 0x8C, 0x8C, 0x8C, 0x8C, 0x8B, 0x8B
	.byte 0x8B, 0x8A, 0x8A, 0x8A, 0x8A, 0x89, 0x89, 0x89, 0x88, 0x88, 0x88, 0x88, 0x87, 0x87, 0x87, 0x86
	.byte 0x86, 0x86, 0x86, 0x85, 0x85, 0x85, 0x85, 0x84, 0x84, 0x84, 0x83, 0x83, 0x83, 0x83, 0x82, 0x82
	.byte 0x82, 0x82, 0x81, 0x81, 0x81, 0x81, 0x80, 0x80
_0208F3E8:
	mov r1, r3, lsl #1
	add r1, r1, #1
	rsb lr, lr, #0
	mul r1, lr, r1
	cmp r1, r2, lsl #24
	addmi r0, r0, #1
	ldmia sp!, {lr}
	bx lr
_0208F408:
	eor lr, r0, r1
	and lr, lr, #0x80000000
	cmp r3, #0
	beq _0208F460
	movs r0, r0, lsl #9
	bne _0208F5A8
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _0208F598
	cmp ip, #0xff
	blt _0208F598
	cmp r1, #0
	beq _0208F5B4
	b _0208F590
_0208F444:
	eor lr, r0, r1
	and lr, lr, #0x80000000
	cmp ip, #0
	beq _0208F4C4
_0208F454:
	movs r1, r1, lsl #9
	bne _0208F590
	b _0208F5E0
_0208F460:
	movs r2, r0, lsl #9
	beq _0208F494
	clz r3, r2
	movs r2, r2, lsl r3
	rsb r3, r3, #0
	mov r2, r2, lsr #8
	ands ip, ip, r1, lsr #23
	beq _0208F4EC
	cmp ip, #0xff
	beq _0208F454
	orr r1, r1, #0x800000
	bic lr, r1, #0xff000000
	b _0208F264
_0208F494:
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _0208F4B8
	cmp ip, #0xff
	blt _0208F5E0
	cmp r1, #0
	beq _0208F5E0
	b _0208F590
_0208F4B8:
	cmp r1, #0
	beq _0208F5B4
	b _0208F5E0
_0208F4C4:
	movs ip, r1, lsl #9
	beq _0208F598
	mov lr, ip
	clz ip, lr
	movs lr, lr, lsl ip
	rsb ip, ip, #0
	mov lr, lr, lsr #8
	orr r0, r0, #0x800000
	bic r2, r0, #0xff000000
	b _0208F264
_0208F4EC:
	movs ip, r1, lsl #9
	beq _0208F598
	mov lr, ip
	clz ip, lr
	movs lr, lr, lsl ip
	rsb ip, ip, #0
	mov lr, lr, lsr #8
	b _0208F264
_0208F50C:
	and r0, r0, #0x80000000
	cmn ip, #0x18
	beq _0208F580
	bmi _0208F5D8
	add r1, ip, #0x17
	mov r2, r2, lsl r1
	rsb ip, ip, #0
	mov r3, r3, lsr ip
	orr r0, r0, r3
	rsb lr, lr, #0
	mul r1, lr, r3
	cmp r1, r2
	ldmeqia sp!, {lr}
	bxeq lr
	add r1, r1, lr
	cmp r1, r2
	beq _0208F574
	addmi r0, r0, #1
	subpl r1, r1, lr
	add r1, lr, r1, lsl #1
	cmp r1, r2, lsl #1
	and r3, r0, #1
	addmi r0, r0, #1
	addeq r0, r0, r3
	ldmia sp!, {lr}
	bx lr
_0208F574:
	add r0, r0, #1
	ldmia sp!, {lr}
	bx lr
_0208F580:
	cmn r2, lr
	addne r0, r0, #1
	ldmia sp!, {lr}
	bx lr
_0208F590:
	mov r0, r1
	b _0208F5A8
_0208F598:
	mov r0, #0xff000000
	orr r0, lr, r0, lsr #1
	ldmia sp!, {lr}
	bx lr
_0208F5A8:
	mvn r0, #0x80000000
	ldmia sp!, {lr}
	bx lr
_0208F5B4:
	mvn r0, #0x80000000
	ldmia sp!, {lr}
	bx lr
_0208F5C0:
	tst r0, #0x80000000
	mov r0, #0xff000000
	movne r0, r0, asr #1
	moveq r0, r0, lsr #1
	ldmia sp!, {lr}
	bx lr
_0208F5D8:
	ldmia sp!, {lr}
	bx lr
_0208F5E0:
	mov r0, lr
	ldmia sp!, {lr}
	bx lr
	arm_func_end _fdiv

	; Other names: _f_ftod
	arm_func_start _f2d
_f2d: ; 0x0208F5EC
	and r2, r0, #0x80000000
	mov ip, r0, lsr #0x17
	mov r3, r0, lsl #9
	ands ip, ip, #0xff
	beq _0208F61C
	cmp ip, #0xff
	beq _0208F648
_0208F608:
	add ip, ip, #0x380
	mov r0, r3, lsl #0x14
	orr r1, r2, r3, lsr #12
	orr r1, r1, ip, lsl #20
	bx lr
_0208F61C:
	cmp r3, #0
	bne _0208F630
	mov r1, r2
	mov r0, #0
	bx lr
_0208F630:
	mov r3, r3, lsr #1
	clz ip, r3
	movs r3, r3, lsl ip
	rsb ip, ip, #1
	add r3, r3, r3
	b _0208F608
_0208F648:
	cmp r3, #0
	bhi _0208F660
	ldr r1, _0208F66C ; =0x7FF00000
	orr r1, r1, r2
	mov r0, #0
	bx lr
_0208F660:
	mvn r0, #0
	bic r1, r0, #0x80000000
	bx lr
	.align 2, 0
_0208F66C: .word 0x7FF00000
	arm_func_end _f2d

	; Other names: _f_ftoi
	arm_func_start _ffix
_ffix: ; 0x0208F670
	bic r1, r0, #0x80000000
	mov r2, #0x9e
	subs r2, r2, r1, lsr #23
	ble _0208F698
	mov r1, r1, lsl #8
	orr r1, r1, #0x80000000
	cmp r0, #0
	mov r0, r1, lsr r2
	rsbmi r0, r0, #0
	bx lr
_0208F698:
	mvn r0, r0, asr #31
	add r0, r0, #0x80000000
	bx lr
	arm_func_end _ffix

	; Other names: _f_itof
	arm_func_start _fflt
_fflt: ; 0x0208F6A4
	ands r2, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r0, #0
__f_itof_common:
	bxeq lr
	clz r3, r0
	movs r0, r0, lsl r3
	rsb r3, r3, #0x9e
	ands r1, r0, #0xff
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst r1, #0x80
	bxeq lr
	ands r3, r1, #0x7f
	andeqs r3, r0, #1
	addne r0, r0, #1
	bx lr
	arm_func_end _fflt

	; Other names: _f_utof
	arm_func_start _ffltu
_ffltu: ; 0x0208F6EC
	cmp r0, #0
__f_utof_common:
	bxeq lr
	mov r3, #0x9e
	bmi _0208F708
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
_0208F708:
	ands r2, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst r2, #0x80
	bxeq lr
	ands r1, r2, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
	arm_func_end _ffltu

	; Other names: _f_mul
	arm_func_start _fmul
_fmul: ; 0x0208F734
	eor r2, r0, r1
	and r2, r2, #0x80000000
	mov ip, #0xff
	ands r3, ip, r0, lsr #23
	mov r0, r0, lsl #8
	cmpne r3, #0xff
	beq _0208F7B0
	orr r0, r0, #0x80000000
	ands ip, ip, r1, lsr #23
	mov r1, r1, lsl #8
	cmpne ip, #0xff
	beq _0208F7F0
	orr r1, r1, #0x80000000
_0208F768:
	add ip, r3, ip
	umull r1, r3, r0, r1
	movs r0, r3
	addpl r0, r0, r0
	subpl ip, ip, #1
	subs ip, ip, #0x7f
	bmi _0208F87C
	cmp ip, #0xfe
	bge _0208F8E8
	ands r3, r0, #0xff
	orr r0, r2, r0, lsr #8
	add r0, r0, ip, lsl #23
	tst r3, #0x80
	bxeq lr
	orrs r1, r1, r3, lsl #25
	andeqs r3, r0, #1
	addne r0, r0, #1
	bx lr
_0208F7B0:
	cmp r3, #0
	beq _0208F804
	movs r0, r0, lsl #1
	bne __f_result_x_NaN
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _0208F7E4
	cmp ip, #0xff
	blt __f_result_INF
	cmp r1, #0
	beq __f_result_INF
	b __f_result_x_NaN
_0208F7E4:
	cmp r1, #0
	beq __f_result_invalid
	b __f_result_INF
_0208F7F0:
	cmp ip, #0
	beq _0208F860
_0208F7F8:
	movs r1, r1, lsl #1
	bne __f_result_x_NaN
	b __f_result_INF
_0208F804:
	movs r0, r0, lsl #1
	beq _0208F83C
	mov r0, r0, lsr #1
	clz r3, r0
	movs r0, r0, lsl r3
	rsb r3, r3, #1
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #8
	ands ip, ip, #0xff
	beq _0208F860
	cmp ip, #0xff
	beq _0208F7F8
	orr r1, r1, #0x80000000
	b _0208F768
_0208F83C:
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _0208F90C
	cmp ip, #0xff
	blt _0208F90C
	cmp r1, #0
	beq __f_result_invalid
	b __f_result_x_NaN
_0208F860:
	movs r1, r1, lsl #1
	beq _0208F90C
	mov r1, r1, lsr #1
	clz ip, r1
	movs r1, r1, lsl ip
	rsb ip, ip, #1
	b _0208F768
_0208F87C:
	cmn ip, #0x18
	beq _0208F8C4
	bmi _0208F904
	cmp r1, #0
	orrne r0, r0, #1
	mov r3, r0
	mov r0, r0, lsr #8
	rsb ip, ip, #0
	orr r0, r2, r0, lsr ip
	rsb ip, ip, #0x18
	movs r1, r3, lsl ip
	bxeq lr
	tst r1, #0x80000000
	bxeq lr
	movs r1, r1, lsl #1
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_0208F8C4:
	mov r0, r0, lsl #1
	b _0208F8F4
__f_result_INF:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
__f_result_x_NaN:
	mvn r0, #0x80000000
	bx lr
__f_result_invalid:
	mvn r0, #0x80000000
	bx lr
_0208F8E8:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_0208F8F4:
	movs r1, r0
	mov r0, r2
	addne r0, r0, #1
	bx lr
_0208F904:
	mov r0, r2
	bx lr
_0208F90C:
	mov r0, r2
	bx lr
	arm_func_end _fmul

	arm_func_start sqrtf
sqrtf: ; 0x0208F914
	stmdb sp!, {lr}
	mov r2, #0xff
	cmp r0, r2, lsl #23
	bhs _0208F9B8
	movs ip, r0, lsr #0x17
	beq _0208F998
	bic r0, r0, r2, lsl #23
	orr r0, r0, #0x800000
_0208F934:
	movs ip, ip, asr #1
	bhs _0208F944
	sub ip, ip, #1
	mov r0, r0, lsl #1
_0208F944:
	movs r1, r0, lsl #1
	mov r0, #0
	mov r2, #0
	mov lr, #0x1000000
_0208F954:
	add r3, r2, lr
	cmp r3, r1
	addle r2, r3, lr
	suble r1, r1, r3
	addle r0, r0, lr
	mov r1, r1, lsl #1
	movs lr, lr, lsr #1
	bne _0208F954
	cmp r1, #0
	biceq r0, r0, #1
	movs r0, r0, lsr #1
	adc r0, r0, #0
	add r0, r0, #0x20000000
	sub r0, r0, #0x800000
	add r0, r0, ip, lsl #23
	ldmia sp!, {lr}
	bx lr
_0208F998:
	cmp r0, #0
	ldmeqia sp!, {lr}
	bxeq lr
	clz ip, r0
	movs r0, r0, lsl ip
	rsb ip, ip, #9
	mov r0, r0, lsr #8
	b _0208F934
_0208F9B8:
	ldmeqia sp!, {lr}
	bxeq lr
	tst r0, #0x80000000
	beq _0208F9D4
	bics r3, r0, #0x80000000
	ldmeqia sp!, {lr}
	bxeq lr
_0208F9D4:
	ldr r2, _0208F9F0 ; =0x7FC00000
	orr r0, r0, r2
	ldr r3, _0208F9F4 ; =_022BCA70
	mov r4, #0x21
	str r4, [r3]
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_0208F9F0: .word 0x7FC00000
_0208F9F4: .word _022BCA70
	arm_func_end sqrtf
_0208F9F8:
	.byte 0x01, 0x00, 0x20, 0xE0, 0x01, 0x10, 0x20, 0xE0
	.byte 0x01, 0x00, 0x20, 0xE0

	; Other names: _f_sub
	arm_func_start _fsub
_fsub: ; 0x0208FA04
	eors r2, r0, r1
	eormi r1, r1, #0x80000000
	bmi __fadd_start
__fsub_start:
	subs ip, r0, r1
	eorlo ip, ip, #0x80000000
	sublo r0, r0, ip
	addlo r1, r1, ip
	mov r2, #0x80000000
	mov r3, r0, lsr #0x17
	orr r0, r2, r0, lsl #8
	ands ip, r3, #0xff
	cmpne ip, #0xff
	beq _0208FB2C
	mov ip, r1, lsr #0x17
	orr r1, r2, r1, lsl #8
	ands r2, ip, #0xff
	beq _0208FB6C
_0208FA48:
	subs ip, r3, ip
	beq _0208FA90
	rsb r2, ip, #0x20
	movs r2, r1, lsl r2
	mov r1, r1, lsr ip
	orrne r1, r1, #1
	subs r0, r0, r1
	bpl _0208FAD4
	ands r1, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_0208FA90:
	subs r0, r0, r1
	beq _0208FC38
	mov r2, r3, lsl #0x17
	and r2, r2, #0x80000000
	bic r3, r3, #0x100
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
	cmp r3, #0
	bgt _0208FAC4
	rsb r3, r3, #9
	orr r0, r2, r0, lsr r3
	bx lr
_0208FAC4:
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_0208FAD4:
	mov r2, r3, lsl #0x17
	and r2, r2, #0x80000000
	bic r3, r3, #0x100
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
	cmp r3, #0
	bgt _0208FB00
	rsb r3, r3, #9
	orr r0, r2, r0, lsr r3
	bx lr
_0208FB00:
	ands r1, r0, #0xff
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_0208FB2C:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	ands r3, r3, #0xff
	beq _0208FB94
	movs r0, r0, lsl #1
	bne _0208FC6C
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _0208FC60
	cmp ip, #0xff
	blt _0208FC60
	cmp r1, #0
	beq _0208FC74
	b _0208FC6C
_0208FB6C:
	cmp ip, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	and r3, r3, #0xff
	ands ip, ip, #0xff
	beq _0208FBFC
_0208FB84:
	eor r2, r2, #0x80000000
	movs r1, r1, lsl #1
	bne _0208FC6C
	b _0208FC60
_0208FB94:
	movs r0, r0, lsl #1
	beq _0208FBCC
	mov r0, r0, lsr #1
	mov r3, #1
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #8
	ands ip, ip, #0xff
	beq _0208FBFC
	cmp ip, #0xff
	beq _0208FB84
	orr r1, r1, #0x80000000
	orr r3, r3, r2, lsr #23
	orr ip, ip, r2, lsr #23
	b _0208FA48
_0208FBCC:
	mov r3, r1, lsr #0x17
	mov r0, r1, lsl #9
	ands r2, r3, #0xff
	beq _0208FBF0
	cmp r2, #0xff
	blt _0208FC18
	cmp r0, #0
	bne _0208FC58
	b _0208FC60
_0208FBF0:
	cmp r0, #0
	beq _0208FC38
	b _0208FC18
_0208FBFC:
	movs r1, r1, lsl #1
	beq _0208FC20
	mov r1, r1, lsr #1
	mov ip, #1
	orr ip, ip, r2, lsr #23
	orr r3, r3, r2, lsr #23
	b _0208FA48
_0208FC18:
	mov r0, r1
	bx lr
_0208FC20:
	cmp r0, #0
	subges r3, r3, #1
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_0208FC38:
	mov r0, #0
	bx lr
_0208FC40:
	cmp r0, #0
	subges r3, r3, #1
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_0208FC58:
	mvn r0, #0x80000000
	bx lr
_0208FC60:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_0208FC6C:
	mvn r0, #0x80000000
	bx lr
_0208FC74:
	mvn r0, #0x80000000
	bx lr
	arm_func_end _fsub

	arm_func_start _ll_mod
_ll_mod: ; 0x0208FC7C
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, r1
	orr r4, r4, #1
	b _0208FC9C
	arm_func_end _ll_mod

	; Other names: _ll_div
	arm_func_start _ll_sdiv
_ll_sdiv: ; 0x0208FC8C
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	eor r4, r1, r3
	mov r4, r4, asr #1
	mov r4, r4, lsl #1
_0208FC9C:
	orrs r5, r3, r2
	bne _0208FCAC
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0208FCAC:
	mov r5, r0, lsr #0x1f
	add r5, r5, r1
	mov r6, r2, lsr #0x1f
	add r6, r6, r3
	orrs r6, r5, r6
	bne _0208FCE0
	mov r1, r2
	bl _s32_div_f
	ands r4, r4, #1
	movne r0, r1
	mov r1, r0, asr #0x1f
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0208FCE0:
	cmp r1, #0
	bge _0208FCF0
	rsbs r0, r0, #0
	rsc r1, r1, #0
_0208FCF0:
	cmp r3, #0
	bge _0208FD00
	rsbs r2, r2, #0
	rsc r3, r3, #0
_0208FD00:
	orrs r5, r1, r0
	beq _0208FE24
	mov r5, #0
	mov r6, #1
	cmp r3, #0
	bmi _0208FD2C
_0208FD18:
	add r5, r5, #1
	adds r2, r2, r2
	adcs r3, r3, r3
	bpl _0208FD18
	add r6, r6, r5
_0208FD2C:
	cmp r1, #0
	blt _0208FD4C
_0208FD34:
	cmp r6, #1
	beq _0208FD4C
	sub r6, r6, #1
	adds r0, r0, r0
	adcs r1, r1, r1
	bpl _0208FD34
_0208FD4C:
	mov r7, #0
	mov ip, #0
	mov fp, #0
	b _0208FD74
_0208FD5C:
	orr ip, ip, #1
	subs r6, r6, #1
	beq _0208FDCC
	adds r0, r0, r0
	adcs r1, r1, r1
	adcs r7, r7, r7
_0208FD74:
	subs r0, r0, r2
	sbcs r1, r1, r3
	sbcs r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _0208FD5C
_0208FD90:
	subs r6, r6, #1
	beq _0208FDC4
	adds r0, r0, r0
	adcs r1, r1, r1
	adc r7, r7, r7
	adds r0, r0, r2
	adcs r1, r1, r3
	adc r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _0208FD5C
	b _0208FD90
_0208FDC4:
	adds r0, r0, r2
	adc r1, r1, r3
_0208FDCC:
	ands r7, r4, #1
	moveq r0, ip
	moveq r1, fp
	beq _0208FE04
	subs r7, r5, #0x20
	movge r0, r1, lsr r7
	bge _0208FE28
	rsb r7, r5, #0x20
	mov r0, r0, lsr r5
	orr r0, r0, r1, lsl r7
	mov r1, r1, lsr r5
	b _0208FE04
_0208FDFC:
	mov r0, r1, lsr r7
	mov r1, #0
_0208FE04:
	cmp r4, #0
	blt _0208FE14
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0208FE14:
	rsbs r0, r0, #0
	rsc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0208FE24:
	mov r0, #0
_0208FE28:
	mov r1, #0
	cmp r4, #0
	blt _0208FE14
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end _ll_sdiv

	; Other names: _ull_div
	arm_func_start _ll_udiv
_ll_udiv: ; 0x0208FE3C
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #0
	b _0208FE50
	arm_func_end _ll_udiv

	arm_func_start _ull_mod
_ull_mod: ; 0x0208FE48
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #1
_0208FE50:
	orrs r5, r3, r2
	bne _0208FE60
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_0208FE60:
	orrs r5, r1, r3
	bne _0208FD00
	mov r1, r2
	bl _u32_div_not_0_f
	cmp r4, #0
	movne r0, r1
	mov r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end _ull_mod

	; Other names: _ull_mul
	arm_func_start _ll_mul
_ll_mul: ; 0x0208FE84
	stmdb sp!, {r4, r5, lr}
	umull r5, r4, r0, r2
	mla r4, r0, r3, r4
	mla r4, r2, r1, r4
	mov r1, r4
	mov r0, r5
	ldmia sp!, {r4, r5, lr}
	bx lr
	arm_func_end _ll_mul

	arm_func_start _s32_div_f
_s32_div_f: ; 0x0208FEA4
	eor ip, r0, r1
	and ip, ip, #0x80000000
	cmp r0, #0
	rsblt r0, r0, #0
	addlt ip, ip, #1
	cmp r1, #0
	rsblt r1, r1, #0
	beq _0209009C
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	blo _0209009C
	mov r2, #0x1c
	mov r3, r0, lsr #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	movle r3, r3, lsr #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	movle r3, r3, lsr #8
	cmp r1, r3
	suble r2, r2, #4
	movle r3, r3, lsr #4
	mov r0, r0, lsl r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	mov r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
_0209009C:
	ands r3, ip, #0x80000000
	rsbne r0, r0, #0
	ands r3, ip, #1
	rsbne r1, r1, #0
	bx lr
	arm_func_end _s32_div_f

	arm_func_start _u32_div_f
_u32_div_f: ; 0x020900B0
	cmp r1, #0
	bxeq lr
	arm_func_end _u32_div_f

	arm_func_start _u32_div_not_0_f
_u32_div_not_0_f: ; 0x020900B8
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	bxlo lr
	mov r2, #0x1c
	mov r3, r0, lsr #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	movle r3, r3, lsr #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	movle r3, r3, lsr #8
	cmp r1, r3
	suble r2, r2, #4
	movle r3, r3, lsr #4
	mov r0, r0, lsl r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	mov r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
	bx lr
	arm_func_end _u32_div_not_0_f

	arm_func_start _drdiv
_drdiv: ; 0x02090294
	eor r1, r1, r3
	eor r3, r1, r3
	eor r1, r1, r3
	eor r0, r0, r2
	eor r2, r0, r2
	eor r0, r0, r2
	arm_func_end _drdiv

	; Other names: _d_div
	arm_func_start _ddiv
_ddiv: ; 0x020902AC
	stmdb sp!, {r4, r5, r6, lr}
	ldr lr, _020907EC ; =0x00000FFE
	eor r4, r1, r3
	ands ip, lr, r1, lsr #19
	cmpne ip, lr
	beq _02090658
	bic r1, r1, lr, lsl #20
	orr r1, r1, #0x100000
	add ip, ip, r4, lsr #31
_020902D0:
	ands r4, lr, r3, lsr #19
	cmpne r4, lr
	beq _020906F0
	bic r3, r3, lr, lsl #20
	orr r3, r3, #0x100000
_020902E4:
	sub ip, ip, r4
	cmp r1, r3
	cmpeq r0, r2
	bhs _02090300
	adds r0, r0, r0
	adc r1, r1, r1
	sub ip, ip, #2
_02090300:
	sub r4, pc, #0x24
	ldrb lr, [r4, r3, lsr #12]
	rsbs r2, r2, #0
	rsc r3, r3, #0
	mov r4, #0x20000000
	mla r5, lr, r3, r4
	mov r6, r3, lsl #0xa
	mov r5, r5, lsr #7
	mul lr, r5, lr
	orr r6, r6, r2, lsr #22
	mov lr, lr, lsr #0xd
	mul r5, lr, r6
	mov r6, r1, lsl #0xa
	orr r6, r6, r0, lsr #22
	mov r5, r5, lsr #0x10
	mul r5, lr, r5
	mov lr, lr, lsl #0xe
	add lr, lr, r5, lsr #16
	umull r5, r6, lr, r6
	umull r4, r5, r6, r2
	mla r5, r3, r6, r5
	mov r4, r4, lsr #0x1a
	orr r4, r4, r5, lsl #6
	add r4, r4, r0, lsl #2
	umull lr, r5, r4, lr
	mov r4, #0
	adds r5, r5, r6, lsl #24
	adc r4, r4, r6, lsr #8
	cmp ip, #0x800
	bge _020904E4
	add ip, ip, #0x7f0
	adds ip, ip, #0xc
	bmi _020904FC
	orr r1, r4, ip, lsl #31
	bic ip, ip, #1
	add r1, r1, ip, lsl #19
	tst lr, #0x80000000
	bne _020903D4
	rsbs r2, r2, #0
	mov r4, r4, lsl #1
	add r4, r4, r5, lsr #31
	mul lr, r2, r4
	mov r6, #0
	mov r4, r5, lsl #1
	orr r4, r4, #1
	umlal r6, lr, r4, r2
	rsc r3, r3, #0
	mla lr, r4, r3, lr
	cmp lr, r0, lsl #21
	bmi _020903D4
	mov r0, r5
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020903D4:
	adds r0, r5, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020903E4:
	.byte 0xFF, 0xFF, 0xFE, 0xFD, 0xFC, 0xFB, 0xFA, 0xF9, 0xF8, 0xF7, 0xF6, 0xF5
	.byte 0xF4, 0xF3, 0xF2, 0xF1, 0xF0, 0xF0, 0xEF, 0xEE, 0xED, 0xEC, 0xEB, 0xEA, 0xEA, 0xE9, 0xE8, 0xE7
	.byte 0xE6, 0xE6, 0xE5, 0xE4, 0xE3, 0xE2, 0xE2, 0xE1, 0xE0, 0xDF, 0xDF, 0xDE, 0xDD, 0xDC, 0xDC, 0xDB
	.byte 0xDA, 0xD9, 0xD9, 0xD8, 0xD7, 0xD7, 0xD6, 0xD5, 0xD4, 0xD4, 0xD3, 0xD2, 0xD2, 0xD1, 0xD0, 0xD0
	.byte 0xCF, 0xCE, 0xCE, 0xCD, 0xCC, 0xCC, 0xCB, 0xCB, 0xCA, 0xC9, 0xC9, 0xC8, 0xC8, 0xC7, 0xC6, 0xC6
	.byte 0xC5, 0xC5, 0xC4, 0xC3, 0xC3, 0xC2, 0xC2, 0xC1, 0xC0, 0xC0, 0xBF, 0xBF, 0xBE, 0xBE, 0xBD, 0xBD
	.byte 0xBC, 0xBC, 0xBB, 0xBA, 0xBA, 0xB9, 0xB9, 0xB8, 0xB8, 0xB7, 0xB7, 0xB6, 0xB6, 0xB5, 0xB5, 0xB4
	.byte 0xB4, 0xB3, 0xB3, 0xB2, 0xB2, 0xB1, 0xB1, 0xB0, 0xB0, 0xAF, 0xAF, 0xAF, 0xAE, 0xAE, 0xAD, 0xAD
	.byte 0xAC, 0xAC, 0xAB, 0xAB, 0xAA, 0xAA, 0xAA, 0xA9, 0xA9, 0xA8, 0xA8, 0xA7, 0xA7, 0xA7, 0xA6, 0xA6
	.byte 0xA5, 0xA5, 0xA4, 0xA4, 0xA4, 0xA3, 0xA3, 0xA2, 0xA2, 0xA2, 0xA1, 0xA1, 0xA0, 0xA0, 0xA0, 0x9F
	.byte 0x9F, 0x9E, 0x9E, 0x9E, 0x9D, 0x9D, 0x9D, 0x9C, 0x9C, 0x9B, 0x9B, 0x9B, 0x9A, 0x9A, 0x9A, 0x99
	.byte 0x99, 0x99, 0x98, 0x98, 0x98, 0x97, 0x97, 0x96, 0x96, 0x96, 0x95, 0x95, 0x95, 0x94, 0x94, 0x94
	.byte 0x93, 0x93, 0x93, 0x92, 0x92, 0x92, 0x91, 0x91, 0x91, 0x91, 0x90, 0x90, 0x90, 0x8F, 0x8F, 0x8F
	.byte 0x8E, 0x8E, 0x8E, 0x8D, 0x8D, 0x8D, 0x8C, 0x8C, 0x8C, 0x8C, 0x8B, 0x8B, 0x8B, 0x8A, 0x8A, 0x8A
	.byte 0x8A, 0x89, 0x89, 0x89, 0x88, 0x88, 0x88, 0x88, 0x87, 0x87, 0x87, 0x86, 0x86, 0x86, 0x86, 0x85
	.byte 0x85, 0x85, 0x85, 0x84, 0x84, 0x84, 0x83, 0x83, 0x83, 0x83, 0x82, 0x82, 0x82, 0x82, 0x81, 0x81
	.byte 0x81, 0x81, 0x80, 0x80
_020904E4:
	movs r1, ip, lsl #0x1f
	orr r1, r1, #0x7f000000
	orr r1, r1, #0xf00000
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020904FC:
	mvn r6, ip, asr #1
	cmp r6, #0x34
	bgt _02090648
	beq _02090624
	cmp r6, #0x14
	bge _02090544
	rsb r6, r6, #0x13
	mov lr, r0, lsl r6
	rsb r6, r6, #0x14
	mov r0, r5, lsr r6
	rsb r6, r6, #0x20
	orr r0, r0, r4, lsl r6
	rsb r6, r6, #0x20
	mov r4, r4, lsr r6
	orr r1, r4, ip, lsl #31
	mov ip, lr
	mov lr, #0
	b _02090574
_02090544:
	rsb r6, r6, #0x33
	mov lr, r1, lsl r6
	mov r1, ip, lsl #0x1f
	rsb r6, r6, #0x20
	orr ip, lr, r0, lsr r6
	rsb r6, r6, #0x20
	mov lr, r0, lsl r6
	mov r5, r5, lsr #0x15
	orr r5, r5, r4, lsl #11
	rsb r6, r6, #0x1f
	mov r0, r5, lsr r6
	mov r4, #0
_02090574:
	rsbs r2, r2, #0
	mul r4, r2, r4
	mov r5, #0
	umlal r5, r4, r2, r0
	rsc r3, r3, #0
	mla r4, r0, r3, r4
	cmp r4, ip
	cmpeq r5, lr
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	adds r5, r5, r2
	adc r4, r4, r3
	cmp r4, ip
	bmi _02090618
	bne _020905BC
	cmp r5, lr
	beq _02090608
	blo _02090618
_020905BC:
	subs r5, r5, r2
	sbc r4, r4, r3
_020905C4:
	adds r5, r5, r5
	adc r4, r4, r4
	adds r5, r5, r2
	adc r4, r4, r3
	adds lr, lr, lr
	adc ip, ip, ip
	cmp r4, ip
	bmi _02090608
	ldmneia sp!, {r4, r5, r6, lr}
	bxne lr
	cmp r5, lr
	blo _02090608
	ldmneia sp!, {r4, r5, r6, lr}
	bxne lr
	tst r0, #1
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
_02090608:
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_02090618:
	adds r0, r0, #1
	adc r1, r1, #0
	b _020905C4
_02090624:
	rsbs r2, r2, #0
	rsc r3, r3, #0
	cmp r1, r3
	cmpeq r0, r2
	mov r1, ip, lsl #0x1f
	mov r0, #0
	movne r0, #1
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_02090648:
	mov r1, ip, lsl #0x1f
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_02090658:
	orrs r5, r0, r1, lsl #1
	beq _0209077C
	cmp ip, lr
	beq _020906C0
	movs r1, r1, lsl #0xc
	beq _0209069C
	clz r5, r1
	movs r1, r1, lsl r5
	sub ip, ip, r5
	add r5, ip, #0x1f
	mov r1, r1, lsr #0xb
	orr r1, r1, r0, lsr r5
	rsb r5, r5, #0x20
	mov r0, r0, lsl r5
	mov ip, ip, lsl #1
	orr ip, ip, r4, lsr #31
	b _020902D0
_0209069C:
	mvn ip, #0x13
	clz r5, r0
	movs r0, r0, lsl r5
	sub ip, ip, r5
	mov r1, r0, lsr #0xb
	mov r0, r0, lsl #0x15
	mov ip, ip, lsl #1
	orr ip, ip, r4, lsr #31
	b _020902D0
_020906C0:
	orrs r5, r0, r1, lsl #12
	bne _020907A4
	bic r5, r3, #0x80000000
	cmp r5, lr, lsl #19
	bhs _020906E4
	and r5, r3, #0x80000000
	eor r1, r5, r1
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020906E4:
	orrs r5, r2, r3, lsl #12
	bne _020907C4
	b _020907DC
_020906F0:
	orrs r5, r2, r3, lsl #1
	beq _02090768
	cmp r4, lr
	beq _02090750
	movs r3, r3, lsl #0xc
	beq _02090730
	clz r5, r3
	movs r3, r3, lsl r5
	sub r4, r4, r5
	add r5, r4, #0x1f
	mov r3, r3, lsr #0xb
	orr r3, r3, r2, lsr r5
	rsb r5, r5, #0x20
	mov r2, r2, lsl r5
	mov r4, r4, lsl #1
	b _020902E4
_02090730:
	mvn r4, #0x13
	clz r5, r2
	movs r2, r2, lsl r5
	sub r4, r4, r5
	mov r3, r2, lsr #0xb
	mov r2, r2, lsl #0x15
	mov r4, r4, lsl #1
	b _020902E4
_02090750:
	orrs r5, r2, r3, lsl #12
	bne _020907C4
	mov r1, ip, lsl #0x1f
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_02090768:
	mov r1, ip, lsl #0x1f
	orr r1, r1, lr, lsl #19
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_0209077C:
	orrs r5, r2, r3, lsl #1
	beq _020907DC
	bic r5, r3, #0x80000000
	cmp r5, lr, lsl #19
	cmpeq r2, #0
	bhi _020907C4
	eor r1, r1, r3
	and r1, r1, #0x80000000
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020907A4:
	tst r1, #0x80000
	beq _020907DC
	bic r5, r3, #0x80000000
	cmp r5, lr, lsl #19
	cmpeq r2, #0
	bhi _020907C4
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020907C4:
	tst r3, #0x80000
	beq _020907DC
	mov r1, r3
	mov r0, r2
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020907DC:
	orr r1, r1, #0x7f000000
	orr r1, r1, #0xf80000
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020907EC: .word 0x00000FFE
	arm_func_end _ddiv

	arm_func_start _fp_init
_fp_init: ; 0x020907F0
	bx lr
	arm_func_end _fp_init

	arm_func_start sub_020907F4
sub_020907F4: ; 0x020907F4
	str lr, [sp, #-4]!
	mov r1, r0
	mov r0, #3
	swi 0x123456
	ldr pc, [sp], #4
	arm_func_end sub_020907F4

	arm_func_start sub_02090808
sub_02090808: ; 0x02090808
	str lr, [sp, #-4]!
	mov r1, #0
	mov r0, #7
	swi 0x123456
	ldr pc, [sp], #4
	arm_func_end sub_02090808

	arm_func_start sub_0209081C
sub_0209081C: ; 0x0209081C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	ldr r5, [r6]
	mov r7, r1
	cmp r5, #0
	mov r4, #0
	bls _02090864
_02090838:
	bl sub_02090808
	and r1, r0, #0xff
	cmp r1, #0xd
	strb r0, [r7, r4]
	cmpne r1, #0xa
	addeq r0, r4, #1
	streq r0, [r6]
	beq _02090864
	add r4, r4, #1
	cmp r4, r5
	blo _02090838
_02090864:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_0209081C

	arm_func_start sub_0209086C
sub_0209086C: ; 0x0209086C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, [r2]
	mov r6, r1
	cmp r5, #0
	mov r4, #0
	bls _02090898
_02090884:
	add r0, r6, r4
	bl sub_020907F4
	add r4, r4, #1
	cmp r4, r5
	blo _02090884
_02090898:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_0209086C

	arm_func_start sub_020908A0
sub_020908A0: ; 0x020908A0
	mov r0, #0
	bx lr
	arm_func_end sub_020908A0

	arm_func_start sub_020908A8
sub_020908A8: ; 0x020908A8
	stmdb sp!, {r4, lr}
	ldr r4, _020908D0 ; =_020AEEF0
	b _020908BC
_020908B4:
	blx r0
	add r4, r4, #4
_020908BC:
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	bne _020908B4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020908D0: .word _020AEEF0
	arm_func_end sub_020908A8
	; 0x020908D4
