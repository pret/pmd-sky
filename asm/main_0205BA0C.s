	.include "asm/macros.inc"
	.include "main_0205BA0C.inc"

	.text

	arm_func_start sub_0205BA0C
sub_0205BA0C: ; 0x0205BA0C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
	ldr r8, _0205BA6C ; =_020B0A54
	mov r7, #0xb0
	b _0205BA5C
_0205BA28:
	mul r1, r4, r7
	ldr r2, [r8]
	ldrb r0, [r2, r1]
	add r2, r2, r1
	cmp r6, r0
	bne _0205BA58
	mov r1, r5
	add r0, r2, #0x14
	bl sub_0205B560
	cmp r0, #0
	movne r0, r4
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_0205BA58:
	add r4, r4, #1
_0205BA5C:
	cmp r4, #0x20
	blt _0205BA28
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205BA6C: .word _020B0A54
	arm_func_end sub_0205BA0C

	arm_func_start sub_0205BA70
sub_0205BA70: ; 0x0205BA70
	ldr r1, _0205BAAC ; =_020B0A54
	mov r3, #0
	ldr ip, [r1]
	mov r1, #0xb0
	b _0205BA9C
_0205BA84:
	mul r2, r3, r1
	ldrb r2, [ip, r2]
	cmp r0, r2
	moveq r0, r3
	bxeq lr
	add r3, r3, #1
_0205BA9C:
	cmp r3, #0x20
	blt _0205BA84
	mvn r0, #0
	bx lr
	.align 2, 0
_0205BAAC: .word _020B0A54
	arm_func_end sub_0205BA70

	arm_func_start sub_0205BAB0
sub_0205BAB0: ; 0x0205BAB0
	stmdb sp!, {r4, lr}
	ldr r1, _0205BB74 ; =_020B0A54
	mov r4, #1
	ldr r3, [r1]
	mov r2, #0
	strb r4, [r3]
	ldr r3, [r1]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r3, #4]
	str r0, [r3, #8]
	str r2, [r3, #0xc]
	str r2, [r3, #0x10]
	bl sub_02063504
	mov r4, r0
	bl Rand16Bit
	orr r0, r0, r4, lsl #16
	bl sub_020510E8
	bl sub_02051134
	ldr r1, _0205BB74 ; =_020B0A54
	ldr r1, [r1]
	str r0, [r1, #0x18]
	bl sub_020634F4
	ldr r1, _0205BB78 ; =_022B57BC
	ldr r0, _0205BB74 ; =_020B0A54
	ldr r1, [r1]
	ldr r0, [r0]
	str r1, [r0, #0x14]
	bl GetLanguageType
	ldr r1, _0205BB74 ; =_020B0A54
	ldr r2, [r1]
	strb r0, [r2, #0x1c]
	ldr r0, [r1]
	add r0, r0, #0x1d
	bl GetMainTeamNameWithCheck
	ldr r0, _0205BB74 ; =_020B0A54
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl GetMaxRescueAttempts
	ldr r1, _0205BB74 ; =_020B0A54
	ldr r1, [r1]
	strb r0, [r1, #0xac]
	mov r0, #2
	bl RandInt
	ldr r1, _0205BB74 ; =_020B0A54
	orr r2, r0, #2
	ldr r0, [r1]
	strb r2, [r0, #0xae]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0205BB74: .word _020B0A54
_0205BB78: .word _022B57BC
	arm_func_end sub_0205BAB0

	arm_func_start sub_0205BB7C
sub_0205BB7C: ; 0x0205BB7C
	ldr r3, _0205BBA0 ; =_020B0A54
	mov r2, #0xb0
	ldr r3, [r3]
	mla r3, r1, r2, r3
	ldr r2, [r3, #4]
	ldr r1, [r3, #8]
	str r2, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_0205BBA0: .word _020B0A54
	arm_func_end sub_0205BB7C

	arm_func_start sub_0205BBA4
sub_0205BBA4: ; 0x0205BBA4
	ldr r1, _0205BBF8 ; =_020B0A54
	ldr r3, [r1]
	ldrb r1, [r3]
	cmp r1, #1
	bne _0205BBF0
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0xc]
	cmp r1, #0
	mov r1, #0
	cmpeq r2, #2
	movhs r1, #1
	tst r1, #0xff
	beq _0205BBF0
	cmp r0, #0
	addne r1, r3, #0xc
	ldmneia r1, {r2, r3}
	stmneia r0, {r2, r3}
	mov r0, #1
	bx lr
_0205BBF0:
	mov r0, #0
	bx lr
	.align 2, 0
_0205BBF8: .word _020B0A54
	arm_func_end sub_0205BBA4
