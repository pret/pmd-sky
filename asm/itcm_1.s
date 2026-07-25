	.include "asm/macros.inc"
	.include "itcm.inc"

	.section .itcm,4,1,4

    arm_func_start sub_01FF9BA0
sub_01FF9BA0: ; 0x01FF9BA0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, [r0, #0x10]
	ldrh lr, [r0, #0xa]
	cmp r1, #0
	ldr r2, [r0, #0x18]
	ldr r3, [r0, #0x1c]
	beq _01FF9CFC
	mov ip, #0
_01FF9BC0:
	ldrb r4, [r2, #1]
	ldrb r5, [r2, #2]
	ldrb r6, [r2], #4
	add r4, r1, r4, lsl #2
	add r5, r1, r5, lsl #2
	ldrb r4, [r4, #1]
	ldrb r5, [r5, #2]
	ldrb r6, [r1, r6, lsl #2]
	mul r4, lr, r4
	mul r5, lr, r5
	mul r6, lr, r6
	mov r4, r4, lsr #8
	mov r7, r6, lsr #8
	mov r5, r5, lsr #8
	and r6, r5, #0xff
	and r4, r4, #0xff
	and r5, r4, #0xf8
	and r7, r7, #0xff
	mov r4, ip, lsl #1
	add ip, ip, #1
	and r6, r6, #0xf8
	mov r5, r5, lsl #2
	and r7, r7, #0xf8
	orr r5, r5, r6, lsl #7
	orr r5, r5, r7, asr #3
	strh r5, [r3, r4]
	cmp ip, #0xe0
	blt _01FF9BC0
	b _01FF9C64
_01FF9C34:
	ldrb r4, [r2, #1]
	ldrb r5, [r2, #2]
	ldrb r7, [r2], #4
	and r4, r4, #0xf8
	and r6, r5, #0xf8
	mov r5, r4, lsl #2
	mov r4, ip, lsl #1
	and r7, r7, #0xf8
	orr r5, r5, r6, lsl #7
	orr r5, r5, r7, asr #3
	strh r5, [r3, r4]
	add ip, ip, #1
_01FF9C64:
	cmp ip, #0xf0
	blt _01FF9C34
	b _01FF9CD8
_01FF9C70:
	ldrb r4, [r2, #1]
	ldrb r5, [r2, #2]
	ldrb r6, [r2], #4
	add r4, r1, r4, lsl #2
	add r5, r1, r5, lsl #2
	ldrb r4, [r4, #1]
	ldrb r5, [r5, #2]
	ldrb r6, [r1, r6, lsl #2]
	mul r4, lr, r4
	mul r5, lr, r5
	mul r6, lr, r6
	mov r4, r4, lsr #8
	mov r7, r6, lsr #8
	mov r5, r5, lsr #8
	and r6, r5, #0xff
	and r4, r4, #0xff
	and r5, r4, #0xf8
	and r7, r7, #0xff
	mov r4, ip, lsl #1
	and r6, r6, #0xf8
	mov r5, r5, lsl #2
	and r7, r7, #0xf8
	orr r5, r5, r6, lsl #7
	orr r5, r5, r7, asr #3
	strh r5, [r3, r4]
	add ip, ip, #1
_01FF9CD8:
	ldr r4, [r0, #4]
	cmp ip, r4
	blt _01FF9C70
	ldr r1, _01FF9E10 ; =ov29_02353530
	mov r0, r3
	ldr r1, [r1]
	add r1, r1, #0x4c
	bl Rgb8ToRgb5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_01FF9CFC:
	mov r0, #0
_01FF9D00:
	ldrb r1, [r2, #1]
	ldrb r5, [r2, #2]
	ldrb r7, [r2], #4
	mul r4, r1, lr
	mul r6, r5, lr
	mov r1, r4, lsr #8
	mul r5, r7, lr
	mov r4, r6, lsr #8
	mov r6, r5, lsr #8
	and r5, r4, #0xff
	and r1, r1, #0xff
	and r4, r1, #0xf8
	and r6, r6, #0xff
	mov r1, r0, lsl #1
	add r0, r0, #1
	and r5, r5, #0xf8
	mov r4, r4, lsl #2
	and r6, r6, #0xf8
	orr r4, r4, r5, lsl #7
	orr r4, r4, r6, asr #3
	strh r4, [r3, r1]
	cmp r0, #0xe0
	blt _01FF9D00
	b _01FF9D90
_01FF9D60:
	ldrb r1, [r2, #1]
	ldrb r4, [r2, #2]
	ldrb r6, [r2], #4
	and r1, r1, #0xf8
	and r5, r4, #0xf8
	mov r4, r1, lsl #2
	mov r1, r0, lsl #1
	and r6, r6, #0xf8
	orr r4, r4, r5, lsl #7
	orr r4, r4, r6, asr #3
	strh r4, [r3, r1]
	add r0, r0, #1
_01FF9D90:
	cmp r0, #0xf0
	blt _01FF9D60
	b _01FF9DF0
_01FF9D9C:
	ldrb r1, [r2, #1]
	ldrb r4, [r2, #2]
	ldrb r6, [r2], #4
	mul ip, r1, lr
	mul r5, r4, lr
	mov r1, ip, lsr #8
	mov r4, r5, lsr #8
	mul r7, r6, lr
	and r1, r1, #0xff
	and ip, r1, #0xf8
	mov r5, r7, lsr #8
	and r4, r4, #0xff
	and r5, r5, #0xff
	mov r1, r0, lsl #1
	and r4, r4, #0xf8
	mov ip, ip, lsl #2
	and r5, r5, #0xf8
	orr r4, ip, r4, lsl #7
	orr r4, r4, r5, asr #3
	strh r4, [r3, r1]
	add r0, r0, #1
_01FF9DF0:
	cmp r0, #0xf0
	blt _01FF9D9C
	ldr r1, _01FF9E10 ; =ov29_02353530
	mov r0, r3
	ldr r1, [r1]
	add r1, r1, #0x4c
	bl Rgb8ToRgb5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_01FF9E10: .word ov29_02353530
	arm_func_end sub_01FF9BA0

	arm_func_start sub_01FF9E14
sub_01FF9E14: ; 0x01FF9E14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _01FF9F7C ; =ov29_02353530
	ldr r4, [r0, #0x10]
	ldr r1, [r1]
	cmp r4, #0
	add sb, r1, #0x51
	ldrh sl, [r0, #0xa]
	ldr r5, [r0, #0x18]
	ldr r6, [r0, #0x1c]
	mov r7, #0
	beq _01FF9EE8
	ldr r8, [r0, #4]
	mov fp, r7
	b _01FF9EDC
_01FF9E4C:
	ldrb r0, [sb, r7, asr #4]
	cmp r0, #0
	ldrneb r0, [r5]
	ldrneb r2, [r5, #1]
	ldrneb r3, [r5, #2]
	bne _01FF9EA8
	ldrb r1, [r5, #1]
	ldrb r0, [r5, #2]
	ldrb r2, [r5]
	add r1, r4, r1, lsl #2
	add r0, r4, r0, lsl #2
	ldrb r2, [r4, r2, lsl #2]
	ldrb r1, [r1, #1]
	ldrb r0, [r0, #2]
	mul r2, sl, r2
	mul r1, sl, r1
	mul r0, sl, r0
	mov r3, r2, lsr #8
	mov r2, r1, lsr #8
	mov r1, r0, lsr #8
	and r0, r3, #0xff
	and r2, r2, #0xff
	and r3, r1, #0xff
_01FF9EA8:
	and r1, r2, #0xf8
	and r2, r3, #0xf8
	mov r1, r1, lsl #2
	and r3, r0, #0xf8
	orr r0, r1, r2, lsl #7
	mov r1, fp
	orr r3, r0, r3, asr #3
	mov r2, r7, lsl #1
	and r0, r7, #0xff
	strh r3, [r6, r2]
	bl sub_0201BD50
	add r5, r5, #4
	add r7, r7, #1
_01FF9EDC:
	cmp r7, r8
	blt _01FF9E4C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FF9EE8:
	ldr r4, [r0, #4]
	mov r8, r7
	b _01FF9F70
_01FF9EF4:
	ldrb r0, [sb, r7, asr #4]
	cmp r0, #0
	ldrneb r3, [r5]
	ldrneb r1, [r5, #1]
	ldrneb r2, [r5, #2]
	bne _01FF9F3C
	ldrb r2, [r5]
	ldrb r1, [r5, #1]
	ldrb r0, [r5, #2]
	mul r3, r2, sl
	mul r2, r1, sl
	mul r1, r0, sl
	mov r3, r3, lsr #8
	mov r2, r2, lsr #8
	mov r0, r1, lsr #8
	and r3, r3, #0xff
	and r1, r2, #0xff
	and r2, r0, #0xff
_01FF9F3C:
	and r0, r1, #0xf8
	and r1, r2, #0xf8
	mov r0, r0, lsl #2
	and r2, r3, #0xf8
	orr r0, r0, r1, lsl #7
	mov r1, r8
	orr r3, r0, r2, asr #3
	mov r2, r7, lsl #1
	and r0, r7, #0xff
	strh r3, [r6, r2]
	bl sub_0201BD50
	add r5, r5, #4
	add r7, r7, #1
_01FF9F70:
	cmp r7, r4
	blt _01FF9EF4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF9F7C: .word ov29_02353530
	arm_func_end sub_01FF9E14

	arm_func_start sub_01FF9F80
sub_01FF9F80: ; 0x01FF9F80
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _01FFA38C ; =ov29_02353530
	ldr r4, [r0, #0x10]
	ldr r1, [r1]
	cmp r4, #0
	add sb, r1, #0x51
	ldrh sl, [r0, #0xa]
	ldr r5, [r0, #0x18]
	ldr r6, [r0, #0x1c]
	beq _01FFA290
	mov r8, #0
_01FF9FAC:
	and r0, r8, #0xff
	add fp, sb, r8
	mov r7, #0
	str r0, [sp]
_01FF9FBC:
	ldrb r0, [fp, #0x10]
	add r1, r7, r8, lsl #8
	add r2, r5, r1, lsl #2
	cmp r0, #0
	ldrneb r0, [r2, #1]
	ldrneb r3, [r5, r1, lsl #2]
	ldrneb r2, [r2, #2]
	bne _01FFA020
	ldrb r0, [r2, #1]
	ldrb ip, [r2, #2]
	ldrb r2, [r5, r1, lsl #2]
	add r0, r4, r0, lsl #2
	ldrb r0, [r0, #1]
	ldrb r3, [r4, r2, lsl #2]
	add r2, r4, ip, lsl #2
	ldrb r2, [r2, #2]
	mul r0, sl, r0
	mul r3, sl, r3
	mul r2, sl, r2
	mov r3, r3, lsr #8
	mov r0, r0, lsr #8
	mov r2, r2, lsr #8
	and r3, r3, #0xff
	and r0, r0, #0xff
	and r2, r2, #0xff
_01FFA020:
	and r0, r0, #0xf8
	and r2, r2, #0xf8
	mov r0, r0, lsl #2
	orr r2, r0, r2, lsl #7
	and r3, r3, #0xf8
	orr r3, r2, r3, asr #3
	mov r1, r1, lsl #1
	strh r3, [r6, r1]
	ldr r0, [sp]
	mov r2, #0
	and r1, r7, #0xff
	bl sub_0201BD80
	add r7, r7, #1
	cmp r7, #0x10
	blt _01FF9FBC
	mov r7, #0x10
	and fp, r8, #0xff
_01FFA064:
	add r1, r7, r8, lsl #8
	add r2, r5, r1, lsl #2
	ldrb r0, [r2, #1]
	ldrb r3, [r2, #2]
	ldrb r2, [r5, r1, lsl #2]
	add r0, r4, r0, lsl #2
	add ip, r4, r3, lsl #2
	ldrb r3, [r0, #1]
	ldrb r0, [ip, #2]
	ldrb ip, [r4, r2, lsl #2]
	mul r2, sl, r3
	mul r3, sl, r0
	mul r0, sl, ip
	mov r2, r2, lsr #8
	mov r3, r3, lsr #8
	and r2, r2, #0xff
	mov r0, r0, lsr #8
	and r2, r2, #0xf8
	and r3, r3, #0xff
	and ip, r0, #0xff
	and r0, r3, #0xf8
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr ip, r2, r0, lsl #7
	orr r3, ip, r3, asr #3
	mov ip, r1, lsl #1
	mov r0, fp
	mov r2, #0
	and r1, r7, #0xff
	strh r3, [r6, ip]
	bl sub_0201BD80
	add r7, r7, #1
	cmp r7, #0x20
	blt _01FFA064
	mov r7, #0xc0
	and fp, r8, #0xff
_01FFA0F4:
	add r1, r7, r8, lsl #8
	add r2, r5, r1, lsl #2
	ldrb r0, [r2, #1]
	ldrb r3, [r2, #2]
	ldrb r2, [r5, r1, lsl #2]
	add r0, r4, r0, lsl #2
	add ip, r4, r3, lsl #2
	ldrb r3, [r0, #1]
	ldrb r0, [ip, #2]
	ldrb ip, [r4, r2, lsl #2]
	mul r2, sl, r3
	mul r3, sl, r0
	mul r0, sl, ip
	mov r2, r2, lsr #8
	mov r3, r3, lsr #8
	and r2, r2, #0xff
	mov r0, r0, lsr #8
	and r2, r2, #0xf8
	and r3, r3, #0xff
	and ip, r0, #0xff
	and r0, r3, #0xf8
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr ip, r2, r0, lsl #7
	orr r3, ip, r3, asr #3
	mov ip, r1, lsl #1
	mov r0, fp
	mov r2, #0
	and r1, r7, #0xff
	strh r3, [r6, ip]
	bl sub_0201BD80
	add r7, r7, #1
	cmp r7, #0xf0
	blt _01FFA0F4
	mov r7, #0xf0
	mov r1, r7
	and r0, r8, #0xff
	mov r2, #0
	bl sub_0201BD80
_01FFA190:
	add r1, r7, r8, lsl #8
	add r2, r5, r1, lsl #2
	ldrb r0, [r2, #1]
	ldrb r3, [r2, #2]
	ldrb fp, [r5, r1, lsl #2]
	mul r2, sl, r0
	mul r3, sl, r3
	mul r0, sl, fp
	mov r2, r2, lsr #8
	mov r3, r3, lsr #8
	and r2, r2, #0xff
	mov fp, r0, lsr #8
	and r3, r3, #0xff
	and r0, r2, #0xf8
	and fp, fp, #0xff
	add r7, r7, #1
	and r2, r3, #0xf8
	mov r0, r0, lsl #2
	and r3, fp, #0xf8
	orr r0, r0, r2, lsl #7
	orr r2, r0, r3, asr #3
	mov r0, r1, lsl #1
	strh r2, [r6, r0]
	cmp r7, #0x100
	blt _01FFA190
	add r8, r8, #1
	cmp r8, #0x10
	blt _01FF9FAC
	mov r7, #0xb0
	mov r8, #0
_01FFA208:
	add r1, r5, r7, lsl #2
	ldrb r0, [r1, #1]
	ldrb r1, [r1, #2]
	ldrb r2, [r5, r7, lsl #2]
	add r0, r4, r0, lsl #2
	add r1, r4, r1, lsl #2
	ldrb r0, [r0, #1]
	ldrb r1, [r1, #2]
	ldrb r2, [r4, r2, lsl #2]
	mul r0, sl, r0
	mul r1, sl, r1
	mul r2, sl, r2
	mov r0, r0, lsr #8
	mov r1, r1, lsr #8
	and r0, r0, #0xff
	mov r2, r2, lsr #8
	and r1, r1, #0xff
	and r0, r0, #0xf8
	and r2, r2, #0xff
	and r1, r1, #0xf8
	mov r0, r0, lsl #2
	and r3, r2, #0xf8
	orr r1, r0, r1, lsl #7
	mov r0, r8
	mov r2, r8
	orr sb, r1, r3, asr #3
	mov r3, r7, lsl #1
	and r1, r7, #0xff
	strh sb, [r6, r3]
	bl sub_0201BD80
	add r7, r7, #1
	cmp r7, #0xc0
	blt _01FFA208
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_01FFA290:
	mov r7, #0
_01FFA294:
	add r0, sb, r7
	ldrb r0, [r0, #0x10]
	mov r8, #0
	and r4, r7, #0xff
	cmp r0, #0
	beq _01FFA304
	mov fp, r8
_01FFA2B0:
	add r1, r8, r7, lsl #8
	add r2, r5, r1, lsl #2
	ldrb r0, [r2, #1]
	ldrb ip, [r2, #2]
	ldrb r2, [r5, r1, lsl #2]
	and r3, r0, #0xf8
	and r0, ip, #0xf8
	mov ip, r3, lsl #2
	and r3, r2, #0xf8
	orr ip, ip, r0, lsl #7
	mov r0, r4
	mov r2, fp
	orr r3, ip, r3, asr #3
	mov ip, r1, lsl #1
	and r1, r8, #0xff
	strh r3, [r6, ip]
	bl sub_0201BD80
	add r8, r8, #1
	cmp r8, #0xf0
	blt _01FFA2B0
	b _01FFA37C
_01FFA304:
	mov fp, r8
_01FFA308:
	add r1, r8, r7, lsl #8
	add r2, r5, r1, lsl #2
	ldrb r0, [r2, #1]
	ldrb ip, [r2, #2]
	ldrb r2, [r5, r1, lsl #2]
	mul r3, sl, r0
	mul r0, sl, ip
	mul ip, sl, r2
	mov r2, r3, lsr #8
	mov r3, r0, lsr #8
	and r2, r2, #0xff
	mov r0, ip, lsr #8
	and r3, r3, #0xff
	and r2, r2, #0xf8
	and ip, r0, #0xff
	and r0, r3, #0xf8
	mov r2, r2, lsl #2
	and r3, ip, #0xf8
	orr ip, r2, r0, lsl #7
	mov r0, r4
	mov r2, fp
	orr r3, ip, r3, asr #3
	mov ip, r1, lsl #1
	and r1, r8, #0xff
	strh r3, [r6, ip]
	bl sub_0201BD80
	add r8, r8, #1
	cmp r8, #0xf0
	blt _01FFA308
_01FFA37C:
	add r7, r7, #1
	cmp r7, #0x10
	blt _01FFA294
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FFA38C: .word ov29_02353530
	arm_func_end sub_01FF9F80

