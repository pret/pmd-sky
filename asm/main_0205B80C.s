	.include "asm/macros.inc"
	.include "main_0205B80C.inc"

	.text

	arm_func_start sub_0205B80C
sub_0205B80C: ; 0x0205B80C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, #0
	ldr r7, _0205B88C ; =_020B0A54
	mov r8, sl
	mov sb, #1
	mov r4, #0xb0
	mov r6, sl
	mov r5, #2
_0205B82C:
	mov r0, sl, lsl #0x18
	ldr r1, [r7]
	mov r0, r0, asr #0x18
	mla r2, r0, r4, r1
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0xc]
	cmp r0, r6
	cmpeq r1, r5
	movhs r0, sb
	movlo r0, r8
	tst r0, #0xff
	ldrneb r0, [r2, #0xad]
	cmpne r0, #0
	ldrneb r0, [r2]
	cmpne r0, #1
	cmpne r0, #7
	beq _0205B87C
	mov r0, sl, lsl #0x18
	mov r0, r0, asr #0x18
	bl sub_0205B7C8
_0205B87C:
	add sl, sl, #1
	cmp sl, #0x20
	blt _0205B82C
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_0205B88C: .word _020B0A54
	arm_func_end sub_0205B80C

	arm_func_start sub_0205B890
sub_0205B890: ; 0x0205B890
	ldr r1, _0205B8C8 ; =_020B0A54
	ldr r2, [r0]
	ldr r3, [r1, #4]
	ldr r0, [r0, #4]
	ldr r1, [r3]
	add r1, r3, r1, lsl #3
	str r2, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r3]
	cmp r0, #0x1f
	addlt r0, r0, #1
	movge r0, #0
	str r0, [r3]
	bx lr
	.align 2, 0
_0205B8C8: .word _020B0A54
	arm_func_end sub_0205B890

	arm_func_start sub_0205B8CC
sub_0205B8CC: ; 0x0205B8CC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #0
	ldr r4, _0205B914 ; =_020B0A54
	b _0205B904
_0205B8E0:
	ldr r0, [r4, #4]
	mov r1, r6
	add r0, r0, #4
	add r0, r0, r5, lsl #3
	bl sub_0205B560
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	add r5, r5, #1
_0205B904:
	cmp r5, #0x20
	blt _0205B8E0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0205B914: .word _020B0A54
	arm_func_end sub_0205B8CC

	arm_func_start sub_0205B918
sub_0205B918: ; 0x0205B918
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r6, r0
	mov r5, r1
	mov r4, #0
	ldr r8, _0205B978 ; =_020B0A54
	mov r7, #0xb0
	b _0205B968
_0205B934:
	mul r1, r4, r7
	ldr r2, [r8]
	ldrb r0, [r2, r1]
	add r2, r2, r1
	cmp r6, r0
	bne _0205B964
	mov r1, r5
	add r0, r2, #0x14
	bl sub_0205B560
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_0205B964:
	add r4, r4, #1
_0205B968:
	cmp r4, #0x20
	blt _0205B934
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0205B978: .word _020B0A54
	arm_func_end sub_0205B918

	arm_func_start GetSosMailCount
GetSosMailCount: ; 0x0205B97C
	stmdb sp!, {r3, lr}
	cmp r1, #0
	ldr r1, _0205B9C4 ; =_020B0A54
	mov r3, #0
	movne lr, #2
	ldr ip, [r1]
	moveq lr, r3
	mov r1, #0xb0
	b _0205B9B4
_0205B9A0:
	mul r2, lr, r1
	ldrb r2, [ip, r2]
	add lr, lr, #1
	cmp r0, r2
	addeq r3, r3, #1
_0205B9B4:
	cmp lr, #0x20
	blt _0205B9A0
	mov r0, r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_0205B9C4: .word _020B0A54
	arm_func_end GetSosMailCount
