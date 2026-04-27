	.include "asm/macros.inc"
	.include "main_0200BC60.inc"

	.text

	arm_func_start sub_0200BC60
sub_0200BC60: ; 0x0200BC60
	stmdb sp!, {r4, lr}
	str r1, [r0]
	add r4, r0, #0x16
	mov lr, #4
_0200BC70:
	ldrb ip, [r3], #1
	subs lr, lr, #1
	strb ip, [r4], #1
	bne _0200BC70
	cmp r1, #3
	cmpne r1, #5
	cmpne r1, #7
	cmpne r1, #9
	cmpne r1, #0xb
	bne _0200BCA4
	mov r1, #2
	bl UpdateFadeStatus
	ldmia sp!, {r4, pc}
_0200BCA4:
	mov r1, r2
	bl sub_0200B928
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200BC60

	arm_func_start sub_0200BCB0
sub_0200BCB0: ; 0x0200BCB0
	stmdb sp!, {r4, lr}
	str r1, [r0]
	add r4, r0, #0x16
	mov lr, #4
_0200BCC0:
	ldrb ip, [r3], #1
	subs lr, lr, #1
	strb ip, [r4], #1
	bne _0200BCC0
	cmp r1, #1
	bne _0200BCE4
	mov r1, #1
	bl UpdateFadeStatus
	ldmia sp!, {r4, pc}
_0200BCE4:
	cmp r1, #3
	cmpne r1, #5
	cmpne r1, #7
	cmpne r1, #9
	cmpne r1, #0xb
	bne _0200BD08
	mov r1, r2
	bl sub_0200B928
	ldmia sp!, {r4, pc}
_0200BD08:
	mov r1, #2
	bl UpdateFadeStatus
	ldmia sp!, {r4, pc}
	arm_func_end sub_0200BCB0

	arm_func_start sub_0200BD14
sub_0200BD14: ; 0x0200BD14
	ldr r0, [r0, #4]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0200BD14

	arm_func_start GetFadeStatus
GetFadeStatus: ; 0x0200BD2C
	ldrsh r1, [r0, #0x10]
	mvn r0, #0xff
	cmp r1, r0
	moveq r0, #1
	bxeq lr
	cmp r1, #0x100
	moveq r0, #2
	movne r0, #0
	bx lr
	arm_func_end GetFadeStatus

	arm_func_start sub_0200BD50
sub_0200BD50: ; 0x0200BD50
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, [r4, #4]
	cmpeq r0, #0
	beq _0200C000
	mov r0, r4
	bl HandleFades
	cmp r0, #0
	beq _0200BF90
	ldr r0, [r4]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0200C000
_0200BD90: ; jump table
	b _0200C000 ; case 0
	b _0200BDC0 ; case 1
	b _0200BDDC ; case 2
	b _0200BDFC ; case 3
	b _0200BE10 ; case 4
	b _0200BE30 ; case 5
	b _0200BE44 ; case 6
	b _0200BEB0 ; case 7
	b _0200BE44 ; case 8
	b _0200BEB0 ; case 9
	b _0200BF10 ; case 10
	b _0200BF54 ; case 11
_0200BDC0:
	ldrsh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A37C
	b _0200C000
_0200BDDC:
	ldrsh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A3A8
	b _0200C000
_0200BDFC:
	ldrh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	bl sub_0200A3DC
	b _0200C000
_0200BE10:
	ldrsh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A410
	b _0200C000
_0200BE30:
	ldrh r1, [r4, #0x14]
	add r0, r4, #0x1c
	add r2, r4, #0x16
	bl sub_0200A444
	b _0200C000
_0200BE44:
	cmp r0, #6
	beq _0200BE58
	cmp r0, #8
	beq _0200BE74
	b _0200BE90
_0200BE58:
	mov r1, #0x90
	mov r0, #0xff
	strb r1, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	b _0200BE90
_0200BE74:
	mov r2, #0xff
	mov r1, #0xc0
	mov r0, #0x80
	strb r2, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r2, [sp, #3]
_0200BE90:
	ldrsh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A410
	b _0200C000
_0200BEB0:
	cmp r0, #7
	beq _0200BEC4
	cmp r0, #9
	beq _0200BEE0
	b _0200BEFC
_0200BEC4:
	mov r1, #0x90
	mov r0, #0xff
	strb r1, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	b _0200BEFC
_0200BEE0:
	mov r2, #0xff
	mov r1, #0xc0
	mov r0, #0x80
	strb r2, [sp]
	strb r1, [sp, #1]
	strb r0, [sp, #2]
	strb r2, [sp, #3]
_0200BEFC:
	ldrh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	bl sub_0200A444
	b _0200C000
_0200BF10:
	mov r0, #0xff
	strb r0, [sp]
	strb r0, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	ldrsh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	add r3, r1, r1, lsl #1
	mov r1, r3, asr #1
	add r1, r3, r1, lsr #30
	mov r1, r1, asr #2
	rsb r1, r1, #0x100
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_0200A3A8
	b _0200C000
_0200BF54:
	mov r0, #0xff
	strb r0, [sp]
	strb r0, [sp, #1]
	strb r0, [sp, #2]
	strb r0, [sp, #3]
	ldrsh r1, [r4, #0x14]
	add r2, sp, #0
	add r0, r4, #0x1c
	rsb r3, r1, #0x100
	mov r1, r3, asr #1
	add r1, r3, r1, lsr #30
	mov r1, r1, lsl #0xe
	mov r1, r1, lsr #0x10
	bl sub_0200A3A8
	b _0200C000
_0200BF90:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0200C000
	ldr r0, [r4]
	cmp r0, #0xb
	addls pc, pc, r0, lsl #2
	b _0200C000
_0200BFAC: ; jump table
	b _0200C000 ; case 0
	b _0200C000 ; case 1
	b _0200BFDC ; case 2
	b _0200BFF0 ; case 3
	b _0200BFDC ; case 4
	b _0200BFF0 ; case 5
	b _0200BFDC ; case 6
	b _0200BFF0 ; case 7
	b _0200BFDC ; case 8
	b _0200BFF0 ; case 9
	b _0200BFDC ; case 10
	b _0200BFF0 ; case 11
_0200BFDC:
	ldrsh r0, [r4, #0x14]
	cmp r0, #0x100
	movge r0, #0
	strge r0, [r4]
	b _0200C000
_0200BFF0:
	ldrsh r0, [r4, #0x14]
	cmp r0, #0
	movle r0, #0
	strle r0, [r4]
_0200C000:
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0200BD50

	arm_func_start sub_0200C008
sub_0200C008: ; 0x0200C008
	ldr ip, _0200C01C ; =sub_0200A29C
	mov r3, r2, lsl #0x10
	mov r2, r1
	mov r1, r3, lsr #0x10
	bx ip
	.align 2, 0
_0200C01C: .word sub_0200A29C
	arm_func_end sub_0200C008

	arm_func_start sub_0200C020
sub_0200C020: ; 0x0200C020
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, [sp, #0x10]
	cmp ip, #0
	beq _0200C084
	ldrb lr, [r1]
	mov r4, #0xff
	ldrb lr, [ip, lr, lsl #2]
	mul lr, r3, lr
	mov lr, lr, lsr #5
	strb lr, [sp]
	ldrb lr, [r1, #1]
	add lr, ip, lr, lsl #2
	ldrb lr, [lr, #1]
	mul lr, r3, lr
	mov lr, lr, lsr #5
	strb lr, [sp, #1]
	ldrb r1, [r1, #2]
	add r1, ip, r1, lsl #2
	ldrb r1, [r1, #2]
	mul r1, r3, r1
	mov r1, r1, lsr #5
	strb r1, [sp, #2]
	strb r4, [sp, #3]
	b _0200C0BC
_0200C084:
	ldrb r4, [r1]
	mov ip, #0xff
	mul lr, r4, r3
	mov r4, lr, lsr #5
	strb r4, [sp]
	ldrb lr, [r1, #1]
	mul r4, lr, r3
	mov r4, r4, lsr #5
	strb r4, [sp, #1]
	ldrb r1, [r1, #2]
	mul r3, r1, r3
	mov r1, r3, lsr #5
	strb r1, [sp, #2]
	strb ip, [sp, #3]
_0200C0BC:
	mov r1, r2, lsl #0x10
	add r2, sp, #0
	mov r1, r1, lsr #0x10
	bl sub_0200A590
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0200C020
