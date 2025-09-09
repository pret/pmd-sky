	.include "asm/macros.inc"
	.include "main_0204DB08.inc"

	.text

	arm_func_start sub_0204DB08
sub_0204DB08: ; 0x0204DB08
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x48
	mov r4, r2
	add r3, r4, r4, lsl #2
	and r2, r3, #7
	add r2, r2, #7
	mov r2, r2, asr #3
	mov r5, r0
	add r0, sp, #0x38
	add r2, r2, r3, asr #3
	bl sub_02050974
	mov sb, #0
	add r8, sp, #0x38
	add r7, sp, #0
	mov r6, #5
	b _0204DB5C
_0204DB48:
	mov r0, r8
	mov r2, r6
	add r1, r7, sb
	bl CopyBitsFrom
	add sb, sb, #1
_0204DB5C:
	cmp sb, r4
	blt _0204DB48
	add r0, sp, #0x38
	bl sub_020509BC
	mov r3, #0
	add r2, sp, #0
	ldr r1, _0204DB9C ; =WONDER_MAIL_BITS_MAP
	b _0204DB8C
_0204DB7C:
	ldrb r0, [r2, r3]
	add r3, r3, #1
	ldrb r0, [r1, r0]
	strb r0, [r5], #1
_0204DB8C:
	cmp r3, r4
	blt _0204DB7C
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0204DB9C: .word WONDER_MAIL_BITS_MAP
	arm_func_end sub_0204DB08

	arm_func_start sub_0204DBA0
sub_0204DBA0: ; 0x0204DBA0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0xa0
	mov r2, r0
	mov r5, r1
	mov r1, r2
	add r0, sp, #0x10
	mov r2, #0x36
	mov r4, #0
	bl MemcpySimple
	ldr r3, _0204DC9C ; =ARM9_UNKNOWN_TABLE__NA_209E12C
	mov r6, r4
	add r2, sp, #0x10
	add r0, sp, #0x46
	mov ip, r4
_0204DBD8:
	mov lr, ip
	ldrb r1, [r3, r6]
	b _0204DBF0
_0204DBE4:
	cmp lr, r1
	beq _0204DBF8
	add lr, lr, #1
_0204DBF0:
	cmp lr, #0x36
	blt _0204DBE4
_0204DBF8:
	ldrb r1, [r2, lr]
	strb r1, [r0, r6]
	add r6, r6, #1
	cmp r6, #0x36
	blt _0204DBD8
	add r1, sp, #0x7c
	mov r2, #0x36
	bl sub_0204DA2C
	cmp r0, #0
	moveq r0, #0
	beq _0204DC94
	ldrb r0, [sp, #0x7c]
	add r1, sp, #0x7d
	mov r2, #0x20
	bl sub_0204E0A0
	mov r3, #1
	add r2, sp, #0x7c
_0204DC3C:
	ldrb r1, [r2, r3]
	and r0, r3, #0xff
	add r3, r3, #1
	add r0, r1, r0
	add r0, r4, r0
	cmp r3, #0x21
	and r4, r0, #0xff
	blt _0204DC3C
	ldrb r0, [sp, #0x7c]
	cmp r0, r4
	movne r0, #0
	bne _0204DC94
	add r0, sp, #0
	add r1, sp, #0x7d
	mov r2, #0x20
	bl sub_02050974
	add r0, sp, #0
	mov r1, r5
	bl sub_0205C2A4
	add r0, sp, #0
	bl sub_020509BC
	mov r0, #1
_0204DC94:
	add sp, sp, #0xa0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0204DC9C: .word ARM9_UNKNOWN_TABLE__NA_209E12C
	arm_func_end sub_0204DBA0

	arm_func_start sub_0204DCA0
sub_0204DCA0: ; 0x0204DCA0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0xa0
	mov r4, #0
	mov r5, r0
	mov r6, r1
	mov r2, r4
	mov r1, r4
	add r0, sp, #0x7c
_0204DCC0:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #0x22
	blt _0204DCC0
	add r0, sp, #0
	add r1, sp, #0x7d
	mov r2, #0x20
	bl sub_02050990
	add r0, sp, #0
	mov r1, r6
	bl sub_0205C548
	add r0, sp, #0
	bl sub_020509BC
	mov r3, #1
	add r2, sp, #0x7c
_0204DCFC:
	ldrb r1, [r2, r3]
	and r0, r3, #0xff
	add r3, r3, #1
	add r0, r1, r0
	add r0, r4, r0
	cmp r3, #0x21
	and r4, r0, #0xff
	blt _0204DCFC
	add r1, sp, #0x7d
	mov r0, r4
	mov r2, #0x20
	strb r4, [sp, #0x7c]
	bl sub_0204E02C
	add r0, sp, #0x46
	add r1, sp, #0x7c
	mov r2, #0x36
	bl sub_0204DB08
	ldr r2, _0204DD7C ; =ARM9_UNKNOWN_TABLE__NA_209E12C
	mov ip, #0
	add r4, sp, #0x46
	add r1, sp, #0x10
_0204DD50:
	ldrb r3, [r4, ip]
	ldrb r0, [r2, ip]
	add ip, ip, #1
	cmp ip, #0x36
	strb r3, [r1, r0]
	blt _0204DD50
	mov r0, r5
	mov r2, #0x36
	bl MemcpySimple
	add sp, sp, #0xa0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0204DD7C: .word ARM9_UNKNOWN_TABLE__NA_209E12C
	arm_func_end sub_0204DCA0

