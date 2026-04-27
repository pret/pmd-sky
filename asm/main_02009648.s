	.include "asm/macros.inc"
	.include "main_02009648.inc"

	.text

	arm_func_start sub_02009648
sub_02009648: ; 0x02009648
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r0, #1
	bl GX_SetBankForBG
	mov r0, #2
	bl GX_SetBankForOBJ
	mov r0, #0x10
	bl GX_SetBankForBGExtPltt
	mov r0, #0x40
	bl GX_SetBankForOBJExtPltt
	mov r0, #8
	bl GX_SetBankForTex
	mov r0, #0x20
	bl GX_SetBankForTexPltt
	mov r0, #1
	mov r1, #0
	mov r2, r0
	bl GX_SetGraphicsMode
	mov r2, #0x4000000
	ldr r1, [r2]
	ldr r0, _02009B78 ; =0x00005C10
	bic r1, r1, #0x1f00
	orr r1, r1, #0x1f00
	str r1, [r2]
	add r3, r0, #0x208
	ldr r1, [r2]
	mov r0, #0x1c
	bic r1, r1, #0x38000000
	str r1, [r2]
	ldr r4, [r2]
	mov r1, #0
	bic r4, r4, #0x7000000
	str r4, [r2]
	ldrh r4, [r2, #0xa]
	and r4, r4, #0x43
	orr r4, r4, #0x1b80
	strh r4, [r2, #0xa]
	ldrh r4, [r2, #0xc]
	and r4, r4, #0x43
	orr r4, r4, #0xc10
	orr r4, r4, #0x5000
	strh r4, [r2, #0xc]
	ldrh r4, [r2, #0xe]
	and r4, r4, #0x43
	orr r3, r4, r3
	strh r3, [r2, #0xe]
	ldr r3, [r2]
	bic r3, r3, #0xe000
	str r3, [r2]
	ldr r3, [r2]
	bic r3, r3, #0x800000
	str r3, [r2]
	bl sub_02009B98
	mov r0, #0x1c
	mov r1, #0
	bl sub_02009BC0
	mov r0, #0
	mov r1, r0
	bl sub_02009BE8
	mov r0, #0xc
	mov r1, #0
	bl sub_02009C10
	mov r3, #8
	str r3, [sp]
	ldr r0, _02009B7C ; =0x04000050
	mov r1, #1
	mov r2, #0x3e
	bl G2x_SetBlendAlpha_
	ldr ip, _02009B80 ; =0x04000040
	mov lr, #0
	strh lr, [ip]
	strh lr, [ip, #4]
	strh lr, [ip, #2]
	strh lr, [ip, #6]
	sub r4, ip, #0x36
	ldrh r0, [r4]
	sub r3, ip, #0x38
	sub r2, ip, #0x34
	bic r0, r0, #3
	strh r0, [r4]
	ldrh r0, [r3]
	sub r1, ip, #0x32
	mov r6, #0x4000000
	bic r0, r0, #3
	orr r0, r0, #1
	strh r0, [r3]
	ldrh r7, [r2]
	ldr r5, _02009B84 ; =0xFFCFFFEF
	mov r0, #4
	bic r7, r7, #3
	orr r7, r7, #2
	strh r7, [r2]
	ldrh r7, [r1]
	bic r7, r7, #3
	orr r7, r7, #3
	strh r7, [r1]
	str lr, [ip, #-0x2c]
	str lr, [ip, #-0x28]
	str lr, [ip, #-0x24]
	ldrh r7, [r3]
	bic r7, r7, #0x40
	strh r7, [r3]
	ldrh r3, [r4]
	bic r3, r3, #0x40
	strh r3, [r4]
	ldrh r3, [r2]
	bic r3, r3, #0x40
	strh r3, [r2]
	ldrh r2, [r1]
	bic r2, r2, #0x40
	strh r2, [r1]
	ldr r1, [r6]
	and r1, r1, r5
	orr r1, r1, #0x10
	orr r1, r1, #0x200000
	str r1, [r6]
	bl GX_SetBankForSubBG
	mov r0, #0x100
	bl GX_SetBankForSubOBJ
	mov r0, #0x80
	bl GX_SetBankForSubBGExtPltt
	mov r0, #0
	bl GXS_SetGraphicsMode
	ldr r2, _02009B88 ; =0x04001000
	ldr r0, [r2]
	bic r0, r0, #0x1f00
	orr r0, r0, #0x1f00
	str r0, [r2]
	ldrh r0, [r2, #8]
	and r0, r0, #0x43
	orr r0, r0, #0x1a80
	strh r0, [r2, #8]
	ldrh r3, [r2, #0xa]
	ldr r1, _02009B78 ; =0x00005C10
	mov r0, #0x1e
	and r3, r3, #0x43
	orr r3, r3, #0x38c
	orr r3, r3, #0x1800
	strh r3, [r2, #0xa]
	ldrh r4, [r2, #0xc]
	add r3, r1, #0x208
	mov r1, #1
	and r4, r4, #0x43
	orr r4, r4, #0xc10
	orr r4, r4, #0x5000
	strh r4, [r2, #0xc]
	ldrh r4, [r2, #0xe]
	and r4, r4, #0x43
	orr r3, r4, r3
	strh r3, [r2, #0xe]
	ldr r3, [r2]
	bic r3, r3, #0xe000
	str r3, [r2]
	ldr r3, [r2]
	orr r3, r3, #0x800000
	str r3, [r2]
	bl sub_02009CA8
	mov r0, #0x1e
	mov r1, #1
	bl sub_02009CD0
	mov r0, #0
	mov r1, r0
	bl sub_02009CF8
	mov r0, #0x1e
	mov r1, #1
	bl sub_02009D20
	ldr ip, _02009B8C ; =0x04001050
	mov r1, #0
	strh r1, [ip]
	strh r1, [ip, #-0x10]
	strh r1, [ip, #-0xc]
	strh r1, [ip, #-0xe]
	strh r1, [ip, #-0xa]
	sub r3, ip, #0x48
	ldrh r4, [r3]
	sub r0, ip, #0x46
	sub r2, ip, #0x44
	bic r4, r4, #3
	strh r4, [r3]
	ldrh r5, [r0]
	sub r4, ip, #0x42
	bic r5, r5, #3
	orr r5, r5, #1
	strh r5, [r0]
	ldrh r5, [r2]
	bic r5, r5, #3
	orr r5, r5, #2
	strh r5, [r2]
	ldrh r5, [r4]
	bic r5, r5, #3
	orr r5, r5, #3
	strh r5, [r4]
	str r1, [ip, #-0x40]
	str r1, [ip, #-0x3c]
	str r1, [ip, #-0x38]
	str r1, [ip, #-0x34]
	ldrh r5, [r3]
	ldr r6, _02009B90 ; =0xFFFFCFFD
	ldr lr, _02009B94 ; =0x04000304
	bic r5, r5, #0x40
	strh r5, [r3]
	ldrh r3, [r0]
	sub r7, ip, #0x50
	ldr r5, _02009B84 ; =0xFFCFFFEF
	bic r3, r3, #0x40
	strh r3, [r0]
	ldrh r3, [r2]
	sub ip, lr, #0x2a4
	mov r0, r6, lsr #0x16
	bic r3, r3, #0x40
	strh r3, [r2]
	ldrh r8, [r4]
	mov r2, r6, lsr #0x11
	mov r3, #0x3f
	bic r8, r8, #0x40
	strh r8, [r4]
	ldr r4, [r7]
	and r4, r4, r5
	orr r4, r4, #0x10
	orr r4, r4, #0x200000
	str r4, [r7]
	ldrh r4, [lr]
	bic r4, r4, #0x8000
	strh r4, [lr]
	ldrh r4, [ip]
	and r4, r4, r6
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #0x10
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #8
	strh r4, [ip]
	ldrh r4, [ip]
	bic r4, r4, #0x3000
	orr r4, r4, #4
	strh r4, [ip]
	strh r1, [lr, #0x3c]
	str r1, [sp]
	bl G3X_SetClearColor
	mov r0, #0
	bl sub_02009120
	mov r0, #1
	bl sub_02009120
	mov r0, #0
	bl sub_020091CC
	mov r0, #1
	bl sub_020091CC
	mov r0, #0
	bl sub_02009514
	mov r0, #1
	bl sub_02009514
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020091F8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #8]
	bl sub_0200922C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #8]
	bl sub_02009290
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, r0
	str r0, [sp, #8]
	mov r2, r0
	mov r3, r0
	bl sub_020092F4
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_02009358
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, #1
	bl sub_020091F8
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_0200922C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_02009290
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	str r0, [sp, #4]
	mov r4, #1
	str r4, [sp, #8]
	bl sub_020092F4
	mov r0, #0
	str r0, [sp]
	mov r1, r0
	mov r2, r0
	mov r3, r0
	stmib sp, {r0, r4}
	bl sub_02009358
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_02009B78: .word 0x00005C10
_02009B7C: .word 0x04000050
_02009B80: .word 0x04000040
_02009B84: .word 0xFFCFFFEF
_02009B88: .word 0x04001000
_02009B8C: .word 0x04001050
_02009B90: .word 0xFFFFCFFD
_02009B94: .word 0x04000304
	arm_func_end sub_02009648

	arm_func_start sub_02009B98
sub_02009B98: ; 0x02009B98
	ldr r2, _02009BBC ; =0x04000048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009BBC ; =0x04000048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009BBC: .word 0x04000048
	arm_func_end sub_02009B98

	arm_func_start sub_02009BC0
sub_02009BC0: ; 0x02009BC0
	ldr r2, _02009BE4 ; =0x04000048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009BE4 ; =0x04000048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009BE4: .word 0x04000048
	arm_func_end sub_02009BC0

	arm_func_start sub_02009BE8
sub_02009BE8: ; 0x02009BE8
	ldr r2, _02009C0C ; =0x0400004A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009C0C ; =0x0400004A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009C0C: .word 0x0400004A
	arm_func_end sub_02009BE8

	arm_func_start sub_02009C10
sub_02009C10: ; 0x02009C10
	ldr r2, _02009C34 ; =0x0400004A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009C34 ; =0x0400004A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009C34: .word 0x0400004A
	arm_func_end sub_02009C10

	arm_func_start sub_02009C38
sub_02009C38: ; 0x02009C38
	ldr r2, _02009C50 ; =0x0400000A
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C50: .word 0x0400000A
	arm_func_end sub_02009C38

	arm_func_start sub_02009C54
sub_02009C54: ; 0x02009C54
	ldr r2, _02009C6C ; =0x04000008
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C6C: .word 0x04000008
	arm_func_end sub_02009C54

	arm_func_start sub_02009C70
sub_02009C70: ; 0x02009C70
	ldr r2, _02009C88 ; =0x0400000C
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009C88: .word 0x0400000C
	arm_func_end sub_02009C70

	arm_func_start sub_02009C8C
sub_02009C8C: ; 0x02009C8C
	ldr r2, _02009CA4 ; =0x0400000E
	ldrh r1, [r2]
	bic r1, r1, #3
	orr r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_02009CA4: .word 0x0400000E
	arm_func_end sub_02009C8C

	arm_func_start sub_02009CA8
sub_02009CA8: ; 0x02009CA8
	ldr r2, _02009CCC ; =0x04001048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009CCC ; =0x04001048
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009CCC: .word 0x04001048
	arm_func_end sub_02009CA8

	arm_func_start sub_02009CD0
sub_02009CD0: ; 0x02009CD0
	ldr r2, _02009CF4 ; =0x04001048
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009CF4 ; =0x04001048
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009CF4: .word 0x04001048
	arm_func_end sub_02009CD0

	arm_func_start sub_02009CF8
sub_02009CF8: ; 0x02009CF8
	ldr r2, _02009D1C ; =0x0400104A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f00
	orr r1, r1, r0, lsl #8
	ldr r0, _02009D1C ; =0x0400104A
	orrne r1, r1, #0x2000
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009D1C: .word 0x0400104A
	arm_func_end sub_02009CF8

	arm_func_start sub_02009D20
sub_02009D20: ; 0x02009D20
	ldr r2, _02009D44 ; =0x0400104A
	cmp r1, #0
	ldrh r1, [r2]
	bic r1, r1, #0x3f
	orr r1, r1, r0
	ldr r0, _02009D44 ; =0x0400104A
	orrne r1, r1, #0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_02009D44: .word 0x0400104A
	arm_func_end sub_02009D20
